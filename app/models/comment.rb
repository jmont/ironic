class Comment < ActiveRecord::Base
  belongs_to :confession
  attr_accessible :confession_id, :txt
end
