class CreateBlogasaurusPosts < ActiveRecord::Migration
  def change
    create_table :blogasaurus_posts do |t|
      t.text     "intro_text"
      t.text     "full_text"
      t.integer  "author_id", index: true
      t.integer  "category_id", index: true
      t.string   "title"
      t.boolean  "published"
      t.datetime "created_at", index: true
      t.datetime "updated_at"
      t.string   "slug"

      t.timestamps
    end
  end
end
