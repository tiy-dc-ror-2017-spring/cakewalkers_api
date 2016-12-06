class CreateBakeJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :bake_jobs do |t|
      t.integer :product_id
      t.datetime :completed_at
      t.string :state

      t.timestamps
    end
  end
end
