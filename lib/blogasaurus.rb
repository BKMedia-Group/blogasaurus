require "blogasaurus/engine"
require 'haml'
require 'cancan'
require 'thor'
require 'bootstrap-sass'
require 'paperclip'
require 'kaminari'
require 'acts_as_list'
require 'jquery-rails'
require 'ckeditor'
require 'recaptcha'

module Blogasaurus
  mattr_accessor :user_class
  def self.user_class
    @@user_class.constantize || 'User'.constantize
  end
end
