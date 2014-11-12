module Blogasaurus
  class Image < ActiveRecord::Base
    belongs_to :post

    default_scope lambda { order(:position).order(:id) }

    scope :not_inline, lambda { where inline: false }

    has_attached_file :file,
                      styles: {large: ['700', :jpg], medium: ['300x300', :jpg], small: ['120x120^', :jpg]},
                      convert_options: {small: '-gravity center -extent 120x120'}
    validates_attachment_content_type :file, :content_type => %w(image/jpeg image/jpg image/png)

    def url(size = nil)
      file.url size
    end

    def inline_url
      if alignment == 'Center'
        url :large
      else
        url :medium
      end
    end

    def caption_html
      if caption.blank?
        ''
      else
        "<div class='caption'>#{caption}</div>"
      end
    end

    def alignment_class
      alignment.parameterize '-'
    end

    def self.alignments
      %w{Center Float\ Left Float\ Right}
    end
  end
end
