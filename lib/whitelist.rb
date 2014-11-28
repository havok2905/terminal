module Terminal
  class WhiteList
    class << self
      attr_reader :commands
    end

    @commands = [
      "cd",
      "ls",
      "grep",
      "find",
      "cat",
      "open"
    ]

  end
end
