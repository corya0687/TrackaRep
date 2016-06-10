class CommentsController < ApplicationController
  def create
    @comment= Comment.create(comment_params)
    redirect_to workout_path(@comment.workout)
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :workout_id)

    end
end
