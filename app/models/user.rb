class User < ActiveRecord::Base
  attr_accessible :name, :password, :emails_attributes
  validates :name, :password, :presence => :true
  validates :name, :uniqueness => :true

  has_many :emails, :inverse_of => :user
  has_many :links
  has_many :upvotes

  accepts_nested_attributes_for :emails, :reject_if => :all_blank
end
