class Stop < ApplicationRecord
  has_many :schedules
  has_many :routes, through: :schedules

  validates :name, presence: true
  validates :street, presence: true
  validates :key, presence: true, uniqueness: true

  # depends on the business:
  # validates :latitude, presence: true, numericality: true
  # validates :longitude, presence: true, numericality: true
end
