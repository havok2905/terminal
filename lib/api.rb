require 'grape'
require_relative './whitelist.rb'
require_relative './parser.rb'
require_relative './validator.rb'

module Terminal
  class API < Grape::API
    version 'v1', using: :path, vendor: 'terminal'
    format :json
    prefix :api

    resource :command do
      desc 'send a given command to be parsed, validated, sanatized, and executed'
      params do
        requires :input, type: String, desc: 'the string being executed on the terminal'
      end
      post :run do
        status 200
        {

        }
      end

      desc 'return if a given command is valid or not'
      params do
        requires :input, type: String, desc: 'the string being executed on the terminal'
      end
      post :validate do
        status 200
        parser    = Parser.new @input
        whitelist = WhiteList.commands
        validator = Validator.new whitelist, parser.parse

        {
          command: @input,
          valid: validator.whitelisted?
        }
      end

      desc 'return a list of whitelisted commands'
      get :whitelist do
        WhiteList.commands
      end
    end
  end
end
