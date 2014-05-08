class CreateBlogasaurusTags < ActiveRecord::Migration
  def change
    create_table :blogasaurus_tags do |t|
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
