require 'sinatra/base'

# controllers
require './controllers/ApplicationController'
require './controllers/UserAPIController'
require './controllers/ItemAPIController'

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
map('/api/items') {
  run ItemAPIController
}