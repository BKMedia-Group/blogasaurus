class CreateBlogasaurusCategories < ActiveRecord::Migration
  def change
    create_table :blogasaurus_categories do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.attachment :photo

      t.timestamps
    end
  end
end
