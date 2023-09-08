class ChangeAdminColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :workers, :admin, :boolean
    add_column :workers, :admin, :boolean, default: false
  end
end
