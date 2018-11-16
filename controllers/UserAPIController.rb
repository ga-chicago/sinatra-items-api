class UserAPIController < ApplicationController

  # login POST '/api/user/login'
  post '/login' do
    # receive JSON requests like this
    payload_body = request.body.read
    payload = JSON.parse(payload_body).symbolize_keys

    user = User.find_by username: payload[:username]
    pw = payload[:password]

    if user and user.authenticate pw
      session[:logged_in] = true
      session[:username] = user.username
      {
        status: 200,
        message: "Successfully logged in as #{user.username}"
      }.to_json
    else
      {
        status: 403, # check and see if there's a better status code 
        message: "Invalid username or password."
      }.to_json
    end

  end # post '/login' do

  # register POST '/api/user/register'
  post '/register' do

    # receive JSON requests like this
    payload_body = request.body.read
    payload = JSON.parse(payload_body).symbolize_keys

    # user should not be able to choose a username that is taken
    user_exists = User.find_by username: payload[:username]

    if user_exists
      {
        status: 421, # there may be a better status code here
        message: "Username already taken."
      }.to_json
    else
      user = User.new
      user.username = payload[:username]
      user.password = payload[:password] # note this will automatically encrypt
                                        # bc we said has_secure_password in the User model
      user.save
      
      session[:logged_in] = true
      session[:username] = user.username

      {
        status: 200,
        message: "Successfully registered user #{user.username}",
      }.to_json
    end

  end # post '/register' do

  # logout GET '/api/user/logout'
  get '/logout' do
    username = session[:username]
    session.destroy
    {
      status: 200,
      message: "Logged out user #{username}. Bye."
    }.to_json
  end


end