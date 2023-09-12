class AddDescriptionToVacations < ActiveRecord::Migration[7.0]
  def change
    add_column :vacations, :description, :string
  end
end
