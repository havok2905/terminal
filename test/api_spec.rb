require_relative '../lib/api.rb'
require 'rack/test'

describe Terminal::API do
  include Rack::Test::Methods

  def app
    Terminal::API
  end

  let(:success)   { '' }
  let(:blacklist) { '' }
  let(:error)     { '' }

  describe 'POST /api/v1/command/run' do
    it 'should be successful' do
      post '/api/v1/command/run', command: success
    end

    it 'should fail with none whitelisted commands' do
      post '/api/v1/command/run', command: blacklist
    end

    it 'should fail with actual system errors' do
      post '/api/v1/command/run', command: error
    end
  end

  describe 'POST /api/v1/command/validate' do
    it 'should be a valid command is all commands are whitelisted' do
    end

    it 'should not be valid is a command is not whitelisted' do
    end
  end

  describe 'GET /api/v1/command/whitelist' do
    it 'should return a list of whitelisted commands' do
    end
  end

end
