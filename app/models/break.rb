class Break < ApplicationRecord
  
  belongs_to :time_entry
  validates :time_entry_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true, allow_nil: true
  validates :comment, presence: true

  validate :end_time_after_start_time

  def end_time_after_start_time
    if end_time.present? && end_time <= start_time
      errors.add(:end_time, "La hora de finalización debe ser posterior a la hora de inicio.")
    end
  end
  
end
