class Worker < ApplicationRecord
  before_save :downcase_full_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable,
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  has_many :time_entries, dependent: :destroy
  has_many :vacations, dependent: :destroy
  has_one :department
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :dni, presence: true, uniqueness: true, length: { is: 9 }
  validates :department_id, presence: true
  validates :birthdate, presence: true
  validates :admin, inclusion: [true, false]

  scope :admin, -> { where(admin: true) }
  scope :employees, -> { where(admin: false) }

  def downcase_full_name
    self.name = name.downcase
    self.last_name = last_name.downcase
  end

end