module Terminal
  class BlackListedCommandException < Exception
    def initialize(msg = "You are using a black listed command")
      super
    end
  end
end
