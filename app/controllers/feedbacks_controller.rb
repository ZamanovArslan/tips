class FeedbacksController < ApplicationController
  expose :feedback

  def create
    if feedback.save
      FeedbackMailer.feedback(feedback_params).deliver

      redirect_to :contact_us, flash: { success: t(".success") }
    else
      redirect_to :contact_us, flash: { alert: feedback.errors }
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :title, :message)
  end
end
