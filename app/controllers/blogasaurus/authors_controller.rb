require_dependency "blogasaurus/application_controller"

module Blogasaurus
  class AuthorsController < ApplicationController
    before_action :set_author, only: :create
    load_and_authorize_resource

    layout 'layouts/blogasaurus/admin', except: :show

    # GET /blog_authors
    # GET /blog_authors.json
    def index
    end

    # GET /blog_authors/1
    # GET /blog_authors/1.json
    def show
      @posts = @author.posts.accessible_by(current_ability).page(params[:page])
    end

    # GET /blog_authors/new
    def new
    end

    # GET /blog_authors/1/edit
    def edit
    end

    # POST /blog_authors
    # POST /blog_authors.json
    def create
      respond_to do |format|
        if @author.save
          format.html { redirect_to @author, notice: 'Author was successfully created.' }
          format.json { render action: 'show', status: :created, location: @author }
        else
          format.html { render action: 'new' }
          format.json { render json: @author.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /blog_authors/1
    # PATCH/PUT /blog_authors/1.json
    def update
      respond_to do |format|
        if @author.update(blog_author_params)
          format.html { redirect_to @author, notice: 'Author was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @author.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /blog_authors/1
    # DELETE /blog_authors/1.json
    def destroy
      @author.destroy
      respond_to do |format|
        format.html { redirect_to authors_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_author
        @author = Author.new author_params
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def author_params
        params.require(:author).permit(:title, :photo, :bio)
      end
  end
end
