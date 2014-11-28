module Terminal
  class Parser

    attr_reader :input, :response

    def initialize(input)
      @input = input
      @response = []
    end

    def flag?(entry)
      /^-{1}[a-zA-Z0-9]+$/.match(entry)
    end

    def key_value_pair?(entry)
      /^-{2}[a-zA-Z0-9]+={1}.*+$/.match(entry)
    end

    def command_split(entry)
      /([a-zA-Z0-9]+){1} (.*) ((?:&{2}|\|{1}))/.match(entry)
    end

    def parse

      parsed_input = []

      while input
        command = command_split input
        # build new array off the matched data to push to parsed input
        # get the complete string from the matched data
        # replace that matched string with nil in the input string
        # the end case is the input string being nil or not matching any methods any more
          # That will eventually return an exception
      end

      parsed_input
    end

  end
end
