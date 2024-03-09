class CreateJoinTableDriverRoute < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers_routes, id: false do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :route, null: false, foreign_key: true
    end
  end
end
