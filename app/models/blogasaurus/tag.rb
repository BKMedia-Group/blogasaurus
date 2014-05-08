module Blogasaurus
  class Tag < ActiveRecord::Base
    before_save { self.slug = '' } # clear out the slug so it is always updated

    include Blogasaurus::Concerns::Sluggable

    has_many :tag_refs, dependent: :destroy
    has_many :posts, through: :tag_refs

    validates :title, presence: true, uniqueness: true
  end
end
