module Blogasaurus
  class Comment < ActiveRecord::Base
    belongs_to :post

    validates :post, :email, :name, :text, presence: true
    validates :email, format: {with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i}, allow_blank: true

    before_validation do
      self.email = email.downcase
    end

    def photo_url
      require 'digest/md5'
      hash = Digest::MD5.hexdigest(email)
      "http://www.gravatar.com/avatar/#{hash}"
    end
  end
end
