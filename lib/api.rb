require 'grape'

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
      get :run do
      end

      desc 'return if a given command is valid or not'
      params do
        requires :input, type: String, desc: 'the string being executed on the terminal'
      end
      get :validate do
      end

      desc 'return a list of whitelisted commands'
      get :whitelist do
      end
    end
  end
end
