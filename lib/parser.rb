module Terminal
  class Parser

    attr_reader :input

    def initialize(input)
      @input = input
    end

    def parse
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
