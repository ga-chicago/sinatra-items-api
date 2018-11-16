class ItemAPIController < ApplicationController

  # index
  get '/' do
    user = User.find_by username: session[:username]
    {
      status: 200,
      # you could write some pagination attributes here
      # why might you wanna do that?
      # how might you do that?
      items: user.items
    }.to_json
  end

  # create

  # update

  # destroy

  # show -- we'll skip this since our model is so basic

end