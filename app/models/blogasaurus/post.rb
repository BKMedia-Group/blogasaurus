module Blogasaurus
  class Post < ActiveRecord::Base

    include Blogasaurus::Concerns::Sluggable

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

    self.per_page = 10

    def self.search(term)
      like = Rails.env.production? ? 'ILIKE' : 'LIKE'
      where("title #{like} :term OR intro_text #{like} :term OR full_text #{like} :term", term: "%#{term}%")
    end

    def tag_id_list=(ids)
      self.tags = ids.reject {|id| id.blank? }.map { |id| Tag.find id }
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
      images.first.try :file
    end
    def needs_gallery?
      images.length > 1
    end
    def missing_image(params)
      params[:file].blank? && params[:alt].blank? && params[:position].blank? && params[:_destroy] == '0'
    end
  end
end
