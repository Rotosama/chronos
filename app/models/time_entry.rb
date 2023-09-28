class TimeEntry < ApplicationRecord
  belongs_to :worker
  has_many :breaks, dependent: :destroy

  validates :entry_date, presence: true
  validates :exit_date, presence: true, allow_nil: true
  validate :unique_active_time_entry
  validate :no_unclosed_breaks_if_closed
  validate :exit_date_after_entry_date

  def closed?
    exit_date.present?
  end

  def started?
    entry_date.present? && exit_date.blank?
  end

  def paused?
    entry_date.present? &&
    exit_date.blank? &&
    breaks.present? &&
    breaks.last.start_time.present? &&
    breaks.last.end_time.blank?
  end

  def unique_active_time_entry
    if started? && worker.time_entries.where(exit_date: nil).where.not(id: id).exists?
      errors.add(:base, "Solo puede haber una Jornada activa a la vez.")
    end
  end

  def no_unclosed_breaks_if_closed
    if closed? && breaks.where(end_time: nil).exists?
      errors.add(:base, "No se pueden dejar pausas abiertas al cerrar la jornada.")
    end
  end

  def exit_date_after_entry_date
    if exit_date.present? && exit_date <= entry_date
      errors.add(:exit_date, "La hora de salida debe ser posterior a la hora de entrada.")
    end
  end

  def total_time_entry_time
    if closed?
      total_work_time = exit_date - entry_date
    end
    
  end

  def total_breaks_time
    if breaks.present? && closed?
      total = breaks.sum { |b| b.end_time - b.start_time }
    end

  end

  def working_hours
    if breaks.present?
      working_hours = total_time_entry_time - total_breaks_time
    else
      working_hours = total_time_entry_time
    end

     hours = working_hours / 3600
     minutes = (working_hours % 3600) / 60
     seconds = working_hours % 60

     format("%02d:%02d:%02d", hours, minutes, seconds)
  end
  
end
