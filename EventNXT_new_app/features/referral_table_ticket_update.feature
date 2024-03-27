Feature: Update the referral table by updating the tickets bought from the referee

Scenario:
          Given login
          Given we have an event
          Given we have seats
          Given we have guests
          Given we have a referral
          Given we have a ticket information 
          Then the referral table tickets values will be directly equal to the values on the ticket information