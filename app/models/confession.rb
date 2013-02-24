class Confession < ActiveRecord::Base
  has_many :comments
  attr_accessible :txt
  
  default_scope order("created_at DESC")
  
end
