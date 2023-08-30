class Department < ApplicationRecord
  has_many :workers, dependent: :destroy
  validates :name, presence: true
end
