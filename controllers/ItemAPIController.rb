class ItemAPIController < ApplicationController

  # index
  get '/' do

    pp session

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
  post '/' do
    payload_body = request.body.read
    payload = JSON.parse(payload_body).symbolize_keys

    pp session

    user = User.find_by username: session[:username]
    item = Item.new
    item.content = payload[:content]
    item.user_id = user.id
    item.save
    {
      status: 200,
      message: "Created item!",
      item: item
    }.to_json

  end


  # update
  put '/:id' do
    payload_body = request.body.read
    payload = JSON.parse(payload_body).symbolize_keys

    item = Item.find params[:id]
    item.content = payload[:content]
    item.save
    {
      status: 200,
      message: "Updated item!",
      item: item
    }.to_json

  end


  # destroy
  delete '/:id' do
    item_id = params[:id]
    item = Item.find item_id
    item.destroy
    {
      status: 200,
      message: "Destroyed item #{item_id}"
    }.to_json
  end



  # show -- we'll skip this since our model is so basic

  # might be nice to add:

  # routes should produce meaningful JSON error response 
  # (not spilled whiskey)
  # if user is not authenticated

  # pagination
  # to implement this you'd have to look up how to only get
  # a limited number of records back (where would you 
  # look to see how to do that?)

  # you could allow user to specify alphabetical sort?
  # or some other kind of sort?

  # you could implement search (this would be tricky)

end