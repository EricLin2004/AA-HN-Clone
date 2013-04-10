class Comment < ActiveRecord::Base
  attr_accessible :body, :link_id, :creator_id, :parent_id

  belongs_to :link, :inverse_of => :comments
end
