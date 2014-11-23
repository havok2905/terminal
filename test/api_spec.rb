require_relative '../lib/api.rb'
require 'rack/test'
require 'json'

describe Terminal::API do
  include Rack::Test::Methods

  def app
    Terminal::API
  end

  let (:run)       { '/api/v1/command/run' }
  let (:validate)  { '/api/v1/command/validate' }
  let (:whitelist) { '/api/v1/command/whitelist' }

  let(:success)    { '' }
  let(:blacklist)  { '' }
  let(:error)      { '' }

  describe 'POST /api/v1/command/run' do
    it 'should be successful' do
      post run, command: success
    end

    it 'should fail with none whitelisted commands' do
      post run, command: blacklist
    end

    it 'should fail with actual system errors' do
      post run, command: error
    end
  end

  describe 'POST /api/v1/command/validate' do
    it 'should be a valid command is all commands are whitelisted' do
      post validate, command: success
    end

    it 'should not be valid is a command is not whitelisted' do
      post validate, command: blacklist
    end
  end

  describe 'GET /api/v1/command/whitelist' do
    it 'should return a list of whitelisted commands' do
      get whitelist
      response = JSON.parse last_response.body

      expect(last_response.status).to eq(200)
      expect(response.empty?).to be_falsey
    end
  end

end
