class Break < ApplicationRecord
  validates :time_entry_id, presence: true

  belongs_to :time_entry
  
end
