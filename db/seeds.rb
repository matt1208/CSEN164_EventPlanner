Comment.destroy_all
Registration.destroy_all
Event.destroy_all
User.destroy_all
Category.destroy_all

# 1. Seed Categories
tech = Category.create!(name: "Technology")
music = Category.create!(name: "Live Music")
academic = Category.create!(name: "Academic")

# 2. Seed Users (Include 1 Admin)
admin = User.create!(name: "Matthew Van Dyke", email: "mvandyke@scu.edu", password: "password123", admin: true)
user1 = User.create!(name: "Meg", email: "meg@test.com", password: "password123", admin: false)
user2 = User.create!(name: "Charlie Brown", email: "charlie@test.com", password: "password123", admin: false)

# 3. Seed Events
e1 = Event.create!(title: "Hackathon", description: "Build awesome software prototypes together.", date: DateTime.now + 5.days, location: "Heafey Room 102", user: user1, category: tech)
e2 = Event.create!(title: "Campus Festival", description: "Enjoy live performances under the stars.", date: DateTime.now + 12.days, location: "Main Lawn", user: user2, category: music)

# 4. Seed Registrations and Comments
Registration.create!(user: user2, event: e1, status: "Attending")
Registration.create!(user: user1, event: e2, status: "Attending")

Comment.create!(content: "Can't wait to learn more!", user: user2, event: e1)
Comment.create!(content: "Will food be provided?", user: user1, event: e1)

puts "Successfully seeded: #{Category.count} Categories, #{User.count} Users, and #{Event.count} Events!"