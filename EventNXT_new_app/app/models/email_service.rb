class EmailService < ApplicationRecord
    # The optional: true option allows the association to be optional, 
    # => meaning that an email can be sent without being associated with any event.
    belongs_to :event, optional: true
    belongs_to :guest, optional: true
end
