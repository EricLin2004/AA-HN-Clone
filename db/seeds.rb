# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do
  User.create(name: "Eric", password: "cookie")
  User.create(name: "India", password: "chocolate")

  Email.create( user_id: 1, address: "e.lin@live.com")
  Email.create( user_id: 1, address: "eric@lin.com")
  Email.create( user_id: 2, address: "irm@stuff.com")
  Email.create( user_id: 2, address: "india@rae.com")
  Email.create( user_id: 2, address: "india@zeisler.com")

  Link.create(name: 'Great Search Engine!',
              url_name: 'www.google.com', creator_id: 1)
  Link.create(name: "Here's Another Search Engine",
              url_name: 'www.yahoo.com', creator_id: 2)

  Comment.create(link_id: 1, body: "Great googley moogley!", creator_id: 2)
  Comment.create(link_id: 1, body: "Kupo Kupo", parent_id: 1, creator_id: 1)
  Comment.create(link_id: 1, body: "Doooood", parent_id: 1, creator_id: 1)
  Comment.create(link_id: 1, body: "Crazy Time!", parent_id: 2, creator_id: 1)

  CommentAncestor.create(ancestor_id:1, descendent_id:2)
  CommentAncestor.create(ancestor_id:1, descendent_id:3)
  CommentAncestor.create(ancestor_id:2, descendent_id:4)
  CommentAncestor.create(ancestor_id:1, descendent_id:4)
end