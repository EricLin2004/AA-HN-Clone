class Email < ActiveRecord::Base
  attr_accessible :address, :user_id

  belongs_to :user, :inverse_of => :emails
end
