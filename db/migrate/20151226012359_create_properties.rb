class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name, limit: 60
      t.string :description, limit: 200
      t.string :address
      t.string :property_type
      t.integer :floor

      t.timestamps null: false
    end
  end
end
