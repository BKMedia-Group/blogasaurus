class AddVideoThumbnailToBlogasaurusPosts < ActiveRecord::Migration
  def change
    add_attachment :blogasaurus_posts, :video_thumbnail
  end
end
