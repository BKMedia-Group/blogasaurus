$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blogasaurus/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blogasaurus"
  s.version     = Blogasaurus::VERSION
  s.authors     = ["Josh Horner"]
  s.email       = ["josh@bkmediagroup.com"]
  s.homepage    = "http://www.bkmediagroup.com"
  s.summary     = "Fully featured blogging in a mountable engine."
  s.description = "This gem provides blogging functionality in the form of a mountable gem."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "haml-rails"
  s.add_dependency "sass-rails"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "cancan"
  s.add_dependency "paperclip"
  s.add_dependency "will_paginate"
  s.add_dependency "acts_as_list"
  s.add_dependency "jquery-rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "libnotify"
end
