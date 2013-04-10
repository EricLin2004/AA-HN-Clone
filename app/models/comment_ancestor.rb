class CommentAncestor < ActiveRecord::Base
  attr_accessible :ancestor_id, :descendent_id
end
