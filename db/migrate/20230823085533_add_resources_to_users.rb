class AddResourcesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :dni, :string
    add_column :users, :department, :integer
    add_column :users, :birthdate, :date
    add_column :users, :start_date, :date
    add_column :users, :finish_date, :date
    add_column :users, :role, :integer
  end
end
