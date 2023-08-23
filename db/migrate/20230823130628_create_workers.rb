class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :last_name
      t.string :dni
      t.references :department, foreign_key: true
      t.date :birthdate
      t.date :start_date
      t.date :finish_date
      t.integer :role

      t.timestamps
    end
  end
end
