class Vacation < ApplicationRecord
  belongs_to :worker
  validates :status, inclusion: { in: %w(Pendiente Aprobado Rechazado),
    message: "%{status} no es un estado válido" }
  validates :start_time, presence: true
  validates :end_time, presence: true
end