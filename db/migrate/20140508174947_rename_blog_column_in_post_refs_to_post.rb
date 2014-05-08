class RenameBlogColumnInPostRefsToPost < ActiveRecord::Migration
  def change
    rename_column :blogasaurus_tag_refs, :blog_id, :post_id
  end
end
