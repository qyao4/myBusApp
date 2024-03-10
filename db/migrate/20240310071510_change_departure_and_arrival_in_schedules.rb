class ChangeDepartureAndArrivalInSchedules < ActiveRecord::Migration[6.0]
  def change
    change_column :schedules, :departure, :string
    change_column :schedules, :arrival, :string
  end
end
