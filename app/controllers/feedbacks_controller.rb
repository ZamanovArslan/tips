class FeedbacksController < ApplicationController
  expose :feedback

  def create
    if feedback.create
      FeedbackMailer.feedback(feedback_params).deliver
      redirect_to :contact_us_path, message: "Your email successful sent"
    else
      redirect_to :contact_us_path, error: feedback.errors
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :title, :message)
  end
end
