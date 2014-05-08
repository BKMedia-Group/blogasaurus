class RenameBlogColumnInImagesToPosts < ActiveRecord::Migration
  def change
    rename_column :blogasaurus_images, :blog_id, :post_id
  end
end
