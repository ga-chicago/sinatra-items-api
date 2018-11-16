require 'sinatra/base'

# controllers
require './controllers/ApplicationController'
require './controllers/UserAPIController'

# models

# routes
map('/') {
  run ApplicationController
}
map('/api/user') {
  run UserAPIController
}