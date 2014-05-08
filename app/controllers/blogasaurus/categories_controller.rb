require_dependency "blogasaurus/application_controller"

module Blogasaurus
  class CategoriesController < ApplicationController
    before_action :set_category, only: :create
    load_and_authorize_resource

    layout 'layouts/blogasaurus/admin', except: :show

    # GET /blog_categories
    # GET /blog_categories.json
    def index
    end

    # GET /blog_categories/1
    # GET /blog_categories/1.json
    def show
      @posts = @category.posts.accessible_by(current_ability).page(params[:page])
    end

    # GET /blog_categories/new
    def new
    end

    # GET /blog_categories/1/edit
    def edit
    end

    # POST /blog_categories
    # POST /blog_categories.json
    def create
      respond_to do |format|
        if @category.save
          format.html { redirect_to @category, notice: 'Category was successfully created.' }
          format.json { render action: 'show', status: :created, location: @category }
        else
          format.html { render action: 'new' }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /blog_categories/1
    # PATCH/PUT /blog_categories/1.json
    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to @category, notice: 'Category was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /blog_categories/1
    # DELETE /blog_categories/1.json
    def destroy
      @category.destroy
      respond_to do |format|
        format.html { redirect_to categories_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.new category_params
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def category_params
        params.require(:category).permit(:title, :description)
      end
  end
end
