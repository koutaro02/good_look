class CreateMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :maps do |t|
      t.string :spot_name, null: false
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.text :text
      t.timestamps
    end
  end
end
