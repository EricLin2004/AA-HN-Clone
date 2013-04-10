class AddCreatortoComment < ActiveRecord::Migration
  def change
    add_column :comments, :parent_id, :integer
    add_column :comments, :creator_id, :integer
  end
end
