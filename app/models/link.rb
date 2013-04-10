class Link < ActiveRecord::Base
  attr_accessible :name, :url_name, :comments_attributes, :creator_id

  validates :name, :url_name, :presence => :true

  has_many :comments, :inverse_of => :link
  has_many :upvotes
  belongs_to :creator, :class_name => 'User'

  accepts_nested_attributes_for :comments, :reject_if => :all_blank
end
