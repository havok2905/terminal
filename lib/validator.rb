module Terminal
  class Validator

    attr_reader :whitelist, :parsed_input

    def initialize(whitelist, parsed_input)
      @whitelist = whitelist
      @parsed_input = parsed_input
    end

    def whitelisted?
      parsed_input
        .select { |split| !@whitelist.include? split[:command] }
        .empty?
    end

  end
end
