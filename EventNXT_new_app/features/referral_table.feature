Feature: Update the referral table with created referral data

Scenario:
          Given we have a user
          Given we visit the login page
          Given we enter 'aaaaaaa@aaaaaaa.aaa' into 'Email'
          Given we enter 'aaaaaaaa' into 'Password'
          Given we click the 'Log in' button
          Given we have an event
          Given we have seats
          Given we have guests
          When we visit the new page for the referral
          When we enter 'aaaaaaa@aaaaaaa.???' into 'Friend's Email Address'
          When we click the 'Submit'
          Then there will be one additional referral tuple generated with expected attibute on the referee email with 'aaaaaaa@aaaaaaa.???'
         



          