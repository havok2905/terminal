require 'rubygems'
require 'rack'
require 'rack/cors'
require './lib/api.rb'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :get
  end
end

run Terminal::API
