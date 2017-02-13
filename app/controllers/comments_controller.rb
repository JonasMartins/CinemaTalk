class CommentsController < ApplicationController
  
  def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.review_id = params[:review_id]
		@comment.save!
		respond_to do |format|
			format.html { } 
			format.js 
		end
	end

  def index
  	@review = Review.find(params[:review_id])
  	@comments = @review.comments
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
