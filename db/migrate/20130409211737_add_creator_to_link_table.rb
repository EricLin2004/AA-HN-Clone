class AddCreatorToLinkTable < ActiveRecord::Migration
  def change
    add_column :links, :creator_id, :integer
  end
end
