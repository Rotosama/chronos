class TimeEntry < ApplicationRecord
  belongs_to :worker
  has_many :breaks

  validates :entry_date, presence: true
  validates :exit_date, presence: true, allow_nil: true
end
