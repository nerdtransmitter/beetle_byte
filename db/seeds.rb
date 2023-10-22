# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# USERS
User.destroy_all
puts "Creating users..."
users = User.create!([
  { first_name: "Alessia", last_name: "Moison", email: "adm2217@columbia.edu", password: "BeetleJuice96", password_confirmation: "BeetleJuice96",  role: "Project Manager", admin: true },
  { first_name: "Roxie", last_name: "Bianchi", email: "roxieb@beetlebyte.com", password: "BeetleJuice96", password_confirmation: "BeetleJuice96", role: "Lead Developer", admin: false },
  { first_name: "Tommy", last_name: "Shelby", email: "tommy@beetlebyte.com", password: "BeetleJuice96", password_confirmation: "BeetleJuice96", role: "Developer", admin: false }
])


puts "Users successfully created!"

# PROJECTS
# Find existing Project Manager user
user = User.find_by(email: "adm2217@columbia.edu")

# Create project with this user as a creator
puts "Creating bug tracker project..."
project = Project.create!(
  title: "Beetle_Byte",
  description: "A bug tracker for development teams.",
  start_date: Date.new(2023, 10, 9),
  target_date: Date.new(2023, 11, 20),
  created_by_id: user.id
)

puts "First project created!"
