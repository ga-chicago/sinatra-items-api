class User < ActiveRecord::Base
  has_secure_password # cause password to get hashed when saved
  has_many :items
end