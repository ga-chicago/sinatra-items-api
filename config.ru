require 'sinatra/base'

# controllers
require './controllers/ApplicationController'
require './controllers/UserAPIController'

# models
require './models/UserModel'
require './models/ItemModel'

# routes
map('/') {
  run ApplicationController
}
map('/api/user') {
  run UserAPIController
}