class AddVideoEmbedCodeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :video_embed_code, :text
  end
end
