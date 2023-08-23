class CreateTimeEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :time_entries do |t|
      t.references :worker, foreign_key: true
      t.datetime :entry_date
      t.datetime :exit_date

      t.timestamps
    end
  end
end
