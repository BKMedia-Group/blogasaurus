require_dependency "blogasaurus/application_controller"

module Blogasaurus
  class TagsController < ApplicationController
    before_action :set_tag, only: :create
    load_and_authorize_resource

    layout 'layouts/blogasaurus/admin', except: :show

    # GET /tags
    # GET /tags.json
    def index
    end

    # GET /tags/1
    # GET /tags/1.json
    def show
      @posts = @tag.posts.accessible_by(current_ability).page(params[:page])
    end

    # GET /tags/new
    def new
    end

    # GET /tags/1/edit
    def edit
    end

    # POST /tags
    # POST /tags.json
    def create
      respond_to do |format|
        if @tag.save
          format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
          format.json { render action: 'show', status: :created, location: @tag }
        else
          format.html { render action: 'new' }
          format.json { render json: @tag.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tags/1
    # PATCH/PUT /tags/1.json
    def update
      respond_to do |format|
        if @tag.update(tag_params)
          format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @tag.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tags/1
    # DELETE /tags/1.json
    def destroy
      @tag.destroy
      respond_to do |format|
        format.html { redirect_to tags_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_tag
        @tag = Tag.new tag_params
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def tag_params
        params.require(:tag).permit(:title)
      end
  end
end
