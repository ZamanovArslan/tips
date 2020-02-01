class FeedbackMailer < ApplicationMailer
  def feedback(params)
    @body = params[:message]
    mail(to: contact_us_address, from: params[:email], subject: params[:title])
  end

  private

  def contact_us_address
    ENV["MAILER_CONTACT_US_ADDRESS"]
  end
end
