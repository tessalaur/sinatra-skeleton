class User < ActiveRecord::Base
  has_many :sightings
  has_many :comments
end