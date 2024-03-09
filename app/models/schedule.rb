class Schedule < ApplicationRecord
  belongs_to :route
  belongs_to :stop

  validates :arrival, presence: true
  validates :departure, presence: true
end
