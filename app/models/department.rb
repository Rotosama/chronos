class Department < ApplicationRecord
  before_save :downcase_name

  has_many :workers, dependent: :destroy
  validates :name, presence: true

  def downcase_name
    self.name = name.downcase
  end
end
