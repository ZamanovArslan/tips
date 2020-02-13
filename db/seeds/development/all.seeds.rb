# Add tips to admin
user = User.find_by(email: ENV["ADMIN_EMAIL"])

20.times do
  FactoryGirl.create(:tip, user: user)
end
