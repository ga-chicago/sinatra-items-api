class ApplicationController < Sinatra::Base

  require 'bundler'
  Bundler.require()

  require './config/environments'

  # where you currently have:
  # enable :sessions

  # adding this should solve it
  # set :session_secret, "I'm the secret here not you"

  # you could also try this:
  use Rack::Session::Cookie, :key => 'rack.session',
                             :path => '/',
                             :secret => 'your_secret'

  # see http://sinatrarb.com/faq.html#sessions
  
  # # either way
  # do NOT deploy an app with a secret in the codelike this, hide it in an env var or something
  # https://github.com/sinatra/sinatra/issues/1187 <-- a discussion about some other approaches
  # https://stackoverflow.com/a/9747608/5924190
  # https://stackoverflow.com/a/5677589/5924190

  # enable cors
  register Sinatra::CrossOrigin

  configure do
    enable :cross_origin
  end

  # figure out where we are
  where = ENV['RACK_ENV']

  allowed = where == "production" ? 'https://aqueous-chamber-27770.herokuapp.com' : 'http://localhost:3000'

  set :allow_origin, allowed
  set :allow_credentials, true
  set :allow_methods, [:get, :post, :put, :patch, :delete, :options]

  # tell the browser what's ok and what's not
  # this is the route that will respond to the OPTIONS 
  # request sent before the actual request
  options '*' do 
    response.headers['Allow'] = 'HEAD, GET, POST, PUT, PATCH, DELETE, OPTIONS'
    response.headers['Access-Control-Allow-Origin'] = allowed
    response.headers['Access-Control-Allow-Credentials'] = 'true'
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Authorization, Content-Type, Cache-Control, Accept"
    200 #this is the status code & also sends a response
  end

  get '/' do 
    {
      status: 200,
      message: "Please consult api documentation"
    }.to_json
  end
  
  get '/test' do
    binding.pry
    "testing done"
  end

end