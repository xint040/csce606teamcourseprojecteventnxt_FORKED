class Guest < ApplicationRecord
  belongs_to :event
  
  
  # ===================================
  # required to have to pass Rspec tests
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :affiliation, presence: true
  validates :category, presence: true
  validates :event_id, presence: true
  validates :alloted_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :commited_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :guest_commited, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # ===================================
end
