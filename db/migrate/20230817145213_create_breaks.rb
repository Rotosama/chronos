class CreateBreaks < ActiveRecord::Migration[7.0]
  def change
    create_table :breaks do |t|
      t.references :time_entry, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.string :comment

      t.timestamps
    end
  end
end
