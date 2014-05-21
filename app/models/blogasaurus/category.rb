module Blogasaurus
  class Category < ActiveRecord::Base
    include Blogasaurus::Concerns::Sluggable

    has_many :posts, dependent: :nullify # let the associated records go, so they can be re-categoriezed

    validates :title, :description, presence: true

    has_attached_file :photo, styles: {thumb: ['200x200^', :jpg]}, convert_options: {thumb: '-gravity center -extent 200x200'}

    def to_s
      title
    end
  end
end
