# spec/factories/guests.rb
FactoryBot.define do
    factory :guest do
      first_name { "John" }
      last_name { "Doe" }
      affiliation { "Friend" }
      category { "Adult" }
      alloted_seats { 10 }
      commited_seats { 10 }
      guest_commited { 1 }
      status { "Confirmed" }
      association :event, factory: :event
      # Add any other attributes as needed
    end
  end