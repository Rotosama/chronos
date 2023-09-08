class AddAdminToWorkers < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :admin, :boolean, default: false
    remove_column :workers, :role, :integer
  end
end
