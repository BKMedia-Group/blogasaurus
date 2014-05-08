class CreateBlogasaurusImages < ActiveRecord::Migration
  def change
    create_table :blogasaurus_images do |t|
      t.attachment :file
      t.integer :position, index: true
      t.string :alt
      t.integer :blog_id, index: true

      t.timestamps
    end
  end
end
