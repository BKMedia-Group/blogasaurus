class CreateBlogasaurusAuthors < ActiveRecord::Migration
  def change
    create_table :blogasaurus_authors do |t|
      t.string   "title"
      t.text     "bio"
      t.string   "slug"
      t.attachment "photo"

      t.timestamps
    end
  end
end
