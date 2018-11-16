class ApplicationController < Sinatra::Base

  require 'bundler'
  Bundler.require()

  enable :sessions

  ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'salty_items'
  )

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