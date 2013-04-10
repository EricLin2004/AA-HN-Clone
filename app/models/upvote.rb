class Upvote < ActiveRecord::Base
  attr_accessible :link_id, :user_id

  validates :link_id, :uniqueness => { :scope => :user_id }

  belongs_to :link
  belongs_to :user
end
