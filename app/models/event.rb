class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :registrations, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :date, presence: true
  validates :location, presence: true
end