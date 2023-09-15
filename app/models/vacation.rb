class Vacation < ApplicationRecord
  belongs_to :worker
  validates :status, inclusion: { in: %w(Pendiente Aprobado Rechazado),
    message: "%{status} no es un estado válido" }
  validates :start_time, presence: true, comparison: { greater_than_or_equal_to: Date.current.beginning_of_day }
  validates :end_time, presence: true, comparison: { greater_than_or_equal_to: :start_time }
  validates :description, presence: true
end