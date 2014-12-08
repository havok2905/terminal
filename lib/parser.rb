module Terminal
  class Parser

    require 'pry'
    require_relative './exceptions.rb'
    require_relative './whitelist.rb'

    attr_reader :input, :response

    def initialize(input)
      @input = input
      @response = []
    end

    def command?(entry)
      /[a-zA-Z0-9-_]+/.match(entry)
    end

    def argument?(entry)
      /.*/.match(entry)
    end

    def flag?(entry)
      /-{1}[a-zA-Z0-9]+/.match(entry)
    end

    def key_value_pair?(entry)
      /-{2}[a-zA-Z0-9-_]+={1}[a-zA-Z0-9-_.]+/.match(entry)
    end

    def control_flow?(entry)
      /(?:&{2}|\|{1})/.match(entry)
    end

    def command_hash
      {
        name: nil,
        flags: [],
        pairs: [],
        argument: nil,
        control: nil
      }
    end

    def parse
      parsed_input = []
      index = 0

      input.split.each do |entry|
        if command? entry && parsed_input[index][:name].present?
          unless WhiteList.commands.include? entry
            parsed_input[index] = command_hash
            parsed_input[index][:name] = entry
          else
            raise BlackListedCommandException
          end
        elsif flag? entry
          parsed_input[index][:flags].push entry
        elsif key_value_pair? entry
          parsed_input[index][:pairs].push entry
        elsif control_flow? entry
          parsed_input[index][:control] = entry
          index++
        elsif argument? entry
          parsed_input[index][:argument] = entry
        end
      end

      parsed_input
    end

  end
end
