Feature: Update the referral table with created referral data

Scenario:
          Given login
          Given we have an event
          Given we have seats
          Given we have guests
          When we visit the new page for the referral
          When we enter 'aaaaaaa@aaaaaaa.???' into 'Friend's Email Address'
          When we click the 'Submit'
          Then there will be one additional referral tuple generated with expected attibute on the referee email with 'aaaaaaa@aaaaaaa.???'
         



          