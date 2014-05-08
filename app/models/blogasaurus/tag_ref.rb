module Blogasaurus
  class TagRef < ActiveRecord::Base
    belongs_to :post
    belongs_to :tag
  end
end
