class Confession < ActiveRecord::Base
  has_many :comments
  attr_accessible :txt
end
