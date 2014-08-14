class AddVideoEmbedCodeToBlogasaurusPosts < ActiveRecord::Migration
  def change
    add_column :blogasaurus_posts, :video_embed_code, :text
  end
end
