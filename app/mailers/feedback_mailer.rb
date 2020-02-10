class FeedbackMailer < ApplicationMailer
  default to: ENV.fetch("MAILER_CONTACT_US_ADDRESS")

  def feedback(params)
    @body = params[:message]
    mail(from: params[:email], subject: params[:title])
  end
end
