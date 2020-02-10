require "rails_helper"

feature "Send site feedback" do
  let(:user) { build_stubbed :user, :not_confirmed }
  let(:message) { "smth" }
  let(:title) { "title" }

  scenario "Visitor sends email with feedback" do
    visit contact_us_path

    fill_in "Your email for communcations", with: user.email
    fill_in "Title", with: title
    fill_in "Message", with: message

    click_button "Send Feedback"

    open_email(ENV["MAILER_CONTACT_US_ADDRESS"])

    expect(current_email).to have_subject(title)
    expect(current_email.from).to eq([user.email])
    expect(current_email).to have_body_text(message)
  end
end
