class CreateVacations < ActiveRecord::Migration[7.0]
  def change
    create_table :vacations do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :status
      t.references :worker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
