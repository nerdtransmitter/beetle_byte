
# hashed_password = BCrypt::Password.create('password')
puts "Cleaning database..."
Ticket.destroy_all
Project.destroy_all
User.destroy_all
puts "Database cleaned!"

# USERS
puts "Creating users..."
User.create!([
  { first_name: "Alessia", last_name: "Moison", email: "adm2217@columbia.edu", password: "BeetleJuice96", password_confirmation: "BeetleJuice96", role: :project_manager, admin: true },
  { first_name: "Roxie", last_name: "Bianchi", email: "roxieb@beetlebyte.com", password: "BeetleJuice96", password_confirmation: "BeetleJuice96", role: :lead_developer, admin: false },
  { first_name: "Tommy", last_name: "Shelby", email: "tommy@beetlebyte.com", password: "BeetleJuice96", password_confirmation: "BeetleJuice96", role: :developer, admin: false },
  { first_name: "Place", last_name: "Wilson", email: "pw95@beetlebyte.com", password: "BeetleJuice96", password_confirmation: "BeetleJuice96", role: :developer, admin: false },
  { first_name: "Diana", last_name: "Bianchi", email: "diana@beetlebyte.com", password: "BeetleJuice96", password_confirmation: "BeetleJuice96", role: :lead_developer, admin: false },
])

puts "Users successfully created!"

# PROJECTS
# Find existing Project Manager user
user = User.find_by(email: "adm2217@columbia.edu")
# Find existing Lead Developer user
lead_dev = User.find_by(email: "roxieb@beetlebyte.com")
lead_dev2 = User.find_by(email: "diana@beetlebyte.com")

puts "Creating projects..."
Project.create!([
  { title: "Beetle_Byte", description: "A bug tracker for development teams.", start_date: Date.new(2023, 10, 9), target_date: Date.new(2023, 11, 20), created_by_id: user.id, lead_dev_id: lead_dev.id },
  { title: "Portfolio", description: "A portfolio for Alessia Moison.", start_date: Date.new(2023, 04, 23), target_date: Date.new(2023, 12, 31), created_by_id: user.id, lead_dev_id: lead_dev.id },
  { title: "Weather App", description: "A simple responsive weather app using React.", start_date: Date.new(2023, 04, 20), target_date: Date.new(2023, 12, 31), created_by_id: user.id, lead_dev_id: lead_dev2.id }
])

puts "Projects successfully created!"


#TICKETS
# Find existing Project
project = Project.find_by(title: "Beetle_Byte")
lead_dev1 = project.lead_dev

# Find existing developer to assign to ticket
dev = User.find_by(email: "tommy@beetlebyte.com")
dev2 = User.find_by(email: "pw95@beetlebyte.com")

# Create tickets with this project as a parent
puts "Creating tickets..."
Ticket.create!([
  { project_id: project.id, status: :open, priority: :critical, summary: "Create a new project", details: "Create a new project with a title, description, start date, target date, and lead developer.", created_by: lead_dev1, dev_id: dev.id },
  { project_id: project.id, status: :open, priority: :critical, summary: "Create database based on schema", details: "Create schema of database and generate the corresponding models and migrations.", created_by: lead_dev1, dev_id: dev.id },
  { project_id: project.id, status: :open, priority: :medium, summary: "Create a new user", details: "Create a new user with a first name, last name, email, password, role, and admin status.", created_by: lead_dev1, dev_id: dev.id },
  { project_id: project.id, status: :open, priority: :medium, summary: "Seed database", details: "Seed database with instances of users with different roles and admin status, projects and tickets.", created_by: lead_dev1, dev_id: dev2.id },
  { project_id: project.id, status: :open, priority: :medium, summary: "Write documentation", details: "Write documentation for BeetleByte for users and developers.", created_by: lead_dev1, dev_id: dev.id },
  { project_id: project.id, status: :open, priority: :high, summary: "Tickets#Index", details: "Begin the interface for viewing tickets index.", created_by: lead_dev1, dev_id: dev.id },
  { project_id: project.id, status: :open, priority: :medium, summary: "Active Storage", details: "Set up Active Storage.", created_by: lead_dev1, dev_id: dev.id },
  { project_id: project.id, status: :open, priority: :medium, summary: "Add React to app", details: "Install and configure React as BeetleByte's JS framework.", created_by: lead_dev1, dev_id: dev.id },
  { project_id: project.id, status: :open, priority: :medium, summary: "Add DaisyUI to app", details: "Install DaisyUI as BeetleByte's Tailwind plugin.", created_by: lead_dev1, dev_id: dev.id },


])

# Create policies for tickets
# Generate tests for policies
puts "Tickets created!"
