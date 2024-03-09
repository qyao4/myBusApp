class CreateRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :routes do |t|
      t.string :number
      t.string :customer_type
      t.string :coverage

      t.timestamps
    end
  end
end
