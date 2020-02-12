require "csv"
FILE_PATH = "db/seeds/life_areas.csv"

# LifeAreas
CSV.foreach(FILE_PATH, headers: true, header_converters: :symbol) do |row|
  LifeArea.create(value: row[:value], en_value: row[:en_value])
end

# Add admin
admin = User.new(role: :admin, email: ENV["ADMIN_EMAIL"], full_name: "Admin", password: ENV["ADMIN_PASSWORD"])
admin.skip_confirmation!
admin.save!

# Create default company
Company.create(name: Company::DEFAULT_NAME)
