require_dependency "blogasaurus/application_controller"

module Blogasaurus
  class PostsController < ApplicationController
    before_action :set_post, only: :create
    before_action :set_post_optional, only: :new
    load_and_authorize_resource

    layout 'blogasaurus/admin', except: [:index, :show]

    # GET /posts
    # GET /posts.json
    def index
      if params[:search_term]
        @posts = @posts.search(params[:search_term]).page(params[:page])
      else
        @posts = @posts.page(params[:page])
      end
    end

    def archive
      redirect_to posts_path if params[:year].blank?
      if params[:month].blank?
        start_date = Time.new params[:year].to_i
        end_date = start_date + 1.year
      else
        start_date = Time.new params[:year].to_i, params[:month].to_i
        end_date = start_date + 1.month
      end
      @posts = @posts.where('created_at > ?', start_date).where('created_at < ?', end_date).page(params[:page])
    end

    # GET /posts/1
    # GET /posts/1.json
    def show
      @comment = @post.comments.build
    end

    # GET /posts/new
    def new
      5.times do
        @post.images.build
      end
    end

    # GET /posts/1/edit
    def edit
      5.times do
        @post.images.build
      end
    end

    # POST /posts
    # POST /posts.json
    def create
      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render action: 'show', status: :created, location: @post }
        else
          format.html { render action: 'new' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /posts/1
    # PATCH/PUT /posts/1.json
    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /posts/1
    # DELETE /posts/1.json
    def destroy
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.new post_params
      end

      def set_post_optional
        if params.has_key? :post
          set_post
        else
          @post = Post.new
        end
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:post).permit :intro_text,
                                     :full_text,
                                     :author_id,
                                     :category_id,
                                     :image,
                                     :title,
                                     :created_at,
                                     {images_attributes: [:id, :file, :position, :alt, :_destroy]},
                                     {tag_id_list: []},
                                     :published
      end
  end
end
