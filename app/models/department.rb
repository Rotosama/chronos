class Department < ApplicationRecord
  belongs_to :workers
  validates :name, presence: true
end
