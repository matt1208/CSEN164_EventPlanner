class CommentsController < ApplicationController
  before_action :require_user

  # POST 
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @event, notice: "Comment added successfully!"
    else
      redirect_to @event, alert: "Comment content cannot be blank."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end