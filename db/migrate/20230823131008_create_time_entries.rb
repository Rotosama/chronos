class CreateTimeEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :time_entries do |t|
      t.references :user, foreign_key: true
      t.datetime :entry_date
      t.datetime :entry_time
      t.datetime :exit_time

      t.timestamps
    end
  end
end
