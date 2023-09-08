class DeleteContractDates < ActiveRecord::Migration[7.0]
  def change
    remove_column :workers, :start_date, :date
    remove_column :workers, :finish_date, :date
    remove_column :workers, :role, :integere
  end
end
