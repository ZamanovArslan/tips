# User tips
user = User.find_by(email: "lionzamanov@gmail.com")
20.times do
  FactoryGirl.create(:tip, user: user)
end
