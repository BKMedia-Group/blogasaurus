module Blogasaurus
  class Post < ActiveRecord::Base

    include Blogasaurus::Concerns::Sluggable

    IMAGE_REGEX = /(<p>\[image ([^\]]+)\]<\/p>)/

    belongs_to :author
    belongs_to :category
    has_many :tag_refs, dependent: :destroy
    has_many :tags, through: :tag_refs
    has_many :comments, dependent: :destroy

    has_many :images
    accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :missing_image

    validates :author, :category, :full_text, :intro_text, :title, presence: true

    # we don't want any categoryless records in here.
    scope :published, -> { where(published: true) }

    default_scope { order 'created_at DESC' }

    has_attached_file :video_thumbnail,
                      styles: {small: ['120x120^', :jpg]},
                      convert_options: {small: '-gravity center -extent 120x120'}
    validates_attachment_content_type :video_thumbnail, :content_type => %w(image/jpeg image/jpg image/png)

    self.per_page = 10

    def self.search(term)
      like = Rails.env.production? ? 'ILIKE' : 'LIKE'
      where("title #{like} :term OR intro_text #{like} :term OR full_text #{like} :term", term: "%#{term}%")
    end

    def tag_id_list=(ids)
      self.tags = ids.reject {|id| id.blank? }.map { |id| Tag.find id }
    end
    def intro_text_images
      text_images :intro_text
    end
    def full_text_images
      text_images :full_text
    end
    def intro_text_no_images
      text_no_images :intro_text
    end
    def full_text_no_images
      text_no_images :full_text
    end
    def text_images(method)
      rval = send method
      rval.scan(IMAGE_REGEX).uniq.each do |match, code|
        image = images.where(inline: true, code: code).first
        html = "<p><strong>image not found</strong></p>"
        if image
          html = "<div class='inline-image #{image.alignment_class}'><img src='#{image.inline_url}' />#{image.caption_html}</div>"
        end
        rval = rval.gsub match, html
      end
      rval
    end
    def text_no_images(method)
      send(method).gsub IMAGE_REGEX, ''
    end
    def tag_id_list
      tags.map {|tag| tag.id}
    end

    def day
      created_at.day
    end
    def month
      Date::ABBR_MONTHNAMES[created_at.month] + '.'
    end
    def image
      images.not_inline.first.try :file
    end
    def any_image
      images.first.try :file
    end
    def thumbnail_image
      any_image || video_thumbnail
    end
    def needs_gallery?
      images.not_inline.length > 1
    end
    def missing_image(params)
      params[:file].blank? && params[:id].blank?
    end
  end
end
