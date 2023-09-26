class TimeEntry < ApplicationRecord
  belongs_to :worker
  has_many :breaks, dependent: :destroy

  validates :entry_date, presence: true
  validates :exit_date, presence: true, allow_nil: true

  def closed?
    exit_date.present?
  end
end
