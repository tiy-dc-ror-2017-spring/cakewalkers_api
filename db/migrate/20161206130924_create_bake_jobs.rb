class CreateBakeJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :bake_jobs do |t|
      t.integer :product_id
      t.datetime :completed_at
      t.integer :quantity
      t.integer :estimated_time_to_completion_in_seconds
      t.datetime :started_at
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
