class CommentsController < ApplicationController\

  def new
  end

  def create
    event_id = params[:comment][:event_id]
    user_id  = current_user.id
    @event = Event.where(id: event_id).first
    @comment = @event.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to @event
    else
      flash[:danger] = "error! please try again"
      render 'static_pages/home'
    end
  end

  def show
    @comments = @event.comments
  end

  def destroy

  end

  private

  def comment_params
      params.require(:comment).permit(:content, :event_id, :user_id)
  end
end
