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

  let (:command)   { 'ls | grep foobar' }

  after do
    response = JSON.parse last_response.body
    expect(last_response.status).to eq(200)
    expect(response.empty?).to be_falsey
  end

  describe 'POST /api/v1/command/run' do
    it 'should be successful' do
      post run, input: command
    end
  end

  describe 'POST /api/v1/command/validate' do
    it 'should be a valid command is all commands are whitelisted' do
      post validate, input: command
    end
  end

  describe 'GET /api/v1/command/whitelist' do
    it 'should return a list of whitelisted commands' do
      get whitelist
    end
  end

end
