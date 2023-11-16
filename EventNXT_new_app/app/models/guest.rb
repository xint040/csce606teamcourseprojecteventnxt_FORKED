class Guest < ApplicationRecord
  belongs_to :event
  
  before_create :generate_rsvp_link
  
  # ===================================
  # required to have to pass Rspec tests
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :affiliation, presence: true
  validates :category, presence: true
  validates :event_id, presence: true
  validates :alloted_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :commited_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :guest_commited, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # ===================================

  private

  def generate_rsvp_link
    self.rsvp_link = SecureRandom.hex(6) # You can adjust the length as needed
  end
end
