class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.integer :time_to_bake_in_seconds

      t.timestamps
    end
    add_index :products, :code, unique: true
  end
end
