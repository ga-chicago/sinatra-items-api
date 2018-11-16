class UserAPIController < ApplicationController

  # login POST '/api/user/login'

  # register POST '/api/user/register'
  post '/register' do
    # receive JSON requests like this
    payload_body = request.body.read
    payload = JSON.parse(payload_body).symbolize_keys

    {
      status: 200,
      message: "hit register route",
      payload: payload
    }.to_json

  end

  # logout GET '/api/user/logout'

end