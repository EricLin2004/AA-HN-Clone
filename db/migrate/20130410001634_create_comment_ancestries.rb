class CreateCommentAncestries < ActiveRecord::Migration
  def change
    create_table :comment_ancestors do |t|
      t.integer :ancestor_id
      t.integer :descendent_id

      t.timestamps
    end
  end
end
