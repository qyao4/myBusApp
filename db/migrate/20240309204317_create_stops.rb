class CreateStops < ActiveRecord::Migration[7.1]
  def change
    create_table :stops do |t|
      t.string :key
      t.string :name
      t.string :street
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
