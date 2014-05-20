require_dependency "blogasaurus/application_controller"

module Blogasaurus
  class CommentsController < ApplicationController
    before_action :set_comment, only: :create
    load_and_authorize_resource

    def create
      @post = @comment.post
      if verify_recaptcha(model: @comment, message: 'Recaptcha invalid') and @comment.save
        flash[:success] = 'Comment created successfully'

        redirect_to @post
      else
        flash.now[:error] = 'There was an error creating your comment.'
        render 'blogasaurus/posts/show'
      end
    end
    def destroy
      @post = @comment.post
      @comment.destroy
      flash[:success] = 'Comment deleted'
      redirect_to @post
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = Comment.new comment_params
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def comment_params
        params.require(:comment).permit(:name, :text, :email, :post_id)
      end
  end
end
