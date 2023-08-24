class TimeEntry < ApplicationRecord
  belongs_to :worker
  has_many :breaks

  validates :entry_date, presence: true
  validates :entry_time, presence: true
  validates :exit_time, presence: true
  validates :entry_time, comparison: { greater_than: :exit_time }
end
