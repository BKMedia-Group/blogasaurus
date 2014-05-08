class CreateBlogasaurusComments < ActiveRecord::Migration
  def change
    create_table :blogasaurus_comments do |t|
      t.string :name
      t.text :text
      t.string :email
      t.integer :blog_id, index: true

      t.timestamps
    end
  end
end
