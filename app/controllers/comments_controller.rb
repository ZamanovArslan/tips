class CommentsController < ApplicationController
  before_action :authenticate_user!

  expose :tip

  def create
    if tip.comments.create(comment_params)
      redirect_to tip_path(tip)
    else
      render :index
    end
  end

  def comment_params
    params[:comment].permit(:text).merge(user_id: current_user.id)
  end
end
