class RenameBlogIdColumnInComments < ActiveRecord::Migration
  def change
    rename_column :blogasaurus_comments, :blog_id, :post_id
  end
end
