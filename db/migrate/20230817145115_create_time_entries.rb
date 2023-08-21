class CreateTimeEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :time_entries do |t|
      t.references :user, foreign_key: true
      t.date :entry_date
      t.time :entry_time
      t.time :exit_time

      t.timestamps
    end
  end
end
