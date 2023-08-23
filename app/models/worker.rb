class Worker < ApplicationRecord
  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true
  validates :last_name, presence: true
  validates :dni, presence: true
  validates :department, presence: true
  validates :birthdate, presence: true
  validates :role, presence: true

end