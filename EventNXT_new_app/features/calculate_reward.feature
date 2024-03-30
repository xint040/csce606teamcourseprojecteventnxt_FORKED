Feature: Update the referral table by calculating reward based on the reward amount

Scenario:
          Given login
          Given we have an event
          Given we have seats
          Given we have guests
          Given we have a referral
          When we go to the event show page
          When we click the 'edit referral' link for the referral we see there
          Then we are on the edit referral page
          When we enter the 'reward input' into 'Reward Input' 
          When we click the 'Submit' button
          Then the reward will be updated to accurate value
         



          