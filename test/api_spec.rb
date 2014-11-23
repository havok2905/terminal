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

end
