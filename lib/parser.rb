require 'pry'

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

    def command_split
      /([a-zA-Z0-9]+){1} (.*) ((?:&{2}|\|{1}))/
    end

    def parse
      # HEY ASSHOLE. STOP OVER COMPLICATING THIS.
      # MAKE A GIANT CAPTURE GROUP FOR THE FLAGS
      # AND VALUE PAIRS AND JUST SPLIT IT BY SPACES.
      # YOU ONLY NEED THE COMMAND AND CONTROL FLOW
      # TO KEEP MOVING.


      # Returning dummy data for testing
      [
        { command: 'cd',   flags: [], value: nil      },
        { command: '&&',   flags: [], value: nil      },
        { command: 'ls',   flags: [], value: nil      },
        { command: '|',    flags: [], value: nil      },
        { command: 'grep', flags: [], value: 'foobar' }
      ]
    end

  end
end
