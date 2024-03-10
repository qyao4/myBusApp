class Route < ApplicationRecord
  has_many :schedules
  has_many :stops, through: :schedules
  has_and_belongs_to_many :drivers

  # enum customer_type: { regular: 0, industrial: 1, school: 2, charter: 3, work: 4 }
  # enum coverage: { regular: 0, express: 1, super_express: 2 }

  validates :number, presence: true, uniqueness: true
  validates :customer_type, presence: true
  validates :coverage, presence: true
end
