class CreateBlogasaurusTagRefs < ActiveRecord::Migration
  def change
    create_table :blogasaurus_tag_refs do |t|
      t.integer :blog_id, index: true
      t.integer :tag_id, index: true

      t.timestamps
    end
    add_index :blogasaurus_tag_refs, [:blog_id, :tag_id], unique: true
  end
end
