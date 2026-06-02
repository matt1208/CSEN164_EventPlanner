# README

# EventPlanner

I decided for Assignment 2 to do the Event Planner to schedule events, register for events, and search for events. 

# Main Features

1. Login & Signup
2. Ability to create events and set tags for the events
3. Ability to edit/delete the event if you are the event creator or an admin
4. Complete to RSVP to an event
5. Ability to comment on an event
6. Search for events

# Models

* **User:**
    * `has_many :events, dependent: :destroy` (Organized items)
    * `has_many :registrations, dependent: :destroy` (RSVP joins)
    * `has_many :registered_events, through: :registrations, source: :event`
    * `has_many :comments, dependent: :destroy`
* **Event (Main Resource #1):**
    * `belongs_to :user` (The creative organizer)
    * `belongs_to :category`
    * `has_many :registrations, dependent: :destroy`
    * `has_many :comments, dependent: :destroy`
* **Category:**
    * `has_many :events, dependent: :destroy`
* **Registration (Main Resource #2 / Join Table):**
    * `belongs_to :user`
    * `belongs_to :event`
    * *Validation:* To only allow people to register once
* **Comment:**
    * `belongs_to :user`
    * `belongs_to :event`

# How to run

# 1. Clone or navigate into the root of the project directory
cd event_planner

# 2. Configure the Ruby bundler
bundle config set --local force_ruby_platform true
bundle install

# 3. Create the underlying databases
bundle exec rails db:create

# 4. Run structural database migrations
bundle exec rails db:migrate

# 5. Execute the automated seed script
bundle exec rails db:seed

# 6. Run the server
bundle exec rails server

# Sample User or Admin
To run as an admin you can login as:
Email: mvandyke@scu.edu
Password: password123

To run as a sample user:
Email: meg@test.com
Password: password123