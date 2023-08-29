class ChangeBreaksColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :breaks, :start_time, :time
    remove_column :breaks, :end_time, :time

    add_column :breaks, :start_time, :datetime
    add_column :breaks, :end_time, :datetime
  end
end
