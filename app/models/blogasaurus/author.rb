module Blogasaurus
  class Author < ActiveRecord::Base

    include Blogasaurus::Concerns::Sluggable

    has_many :posts

    validates :bio, :photo, :title, presence: true

    has_attached_file :photo,
                      styles: {
                        small: ['70x70^', :jpg],
                        large: ['300', :jpg]
                      },
                      convert_options: {
                        small: '-gravity center -extent 70x70'
                      }
    validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)

    # nullifying the blogs would be bad, so we have to assign them to someone else.
    after_destroy do
      blogs.update_all blog_author: BlogAuthor.first
    end

    def to_s
      title
    end
  end
end
