module Blogasaurus::Concerns::Sluggable
  extend ActiveSupport::Concern

  included do
    before_save :create_slug
  end

  def create_slug
    if title && slug.blank?
      self.slug = title.parameterize
    end
  end

  def to_param
    "#{id}-#{slug}"
  end
end
