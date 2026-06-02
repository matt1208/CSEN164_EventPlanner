class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  # Validates that a user can only sign up for a specific event once
  validates :user_id, uniqueness: { scope: :event_id, message: "is already registered for this event" }
end