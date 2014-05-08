require_dependency "blogasaurus/application_controller"

module Blogasaurus
  class BlogsController < ApplicationController
    load_and_authorize_resource

    def index
    end

    def new
      @blog = Blog.new
    end
  end
end
