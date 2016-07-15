
Feature: Registration
  Background:
    Given Registration Profile: Load Registration Page

  Scenario:
    Then Registration Profile: Set User ID and Email to Random Value

    Then Registration Profile: Set Password to pass111
    Then Registration Profile: Set Re-Type password to pass111
    Then Registration Profile: Set How will you use Stamps.com to Both Mailing and Shipping
    Then Registration Profile: Set Referrer Name to Already used in office
    Then Registration Profile: Set 1st Question to What is your mother's maiden name
    Then Registration Profile: Set 1st Answer to stamps
    Then Registration Profile: Set 2nd Question to What was your high school mascot
    Then Registration Profile: Set 2nd Answer to stamps

    Then Registration Profile: Continue to Mailing Information Page
    Then Registration Membership: Set First Name to random
    Then Registration Membership: Set Last Name to random
    Then Registration Membership: Set Company to random
    Then Registration Membership: Set Address to 1990 E. Grand Ave.
    Then Registration Membership: Set City to El Segundo
    Then Registration Membership: Set State to California
    Then Registration Membership: Set Zip Code to 90245
    Then Registration Membership: Set Phone to random
    Then Registration Membership: Set Extenion to random

    Then Registration Membership: Set Cardholder name to random
    Then Registration Membership: Set Card number to 4111111111111111
    Then Registration Membership: Set Expiration Month to February
    Then Registration Membership: Set Expiration Year to 2019
    Then Registration Membership: Set Billing address same as mailing address to Checked
    Then Registration Membership: Set Terms & Conditions to Checked

    Then Registration Membership: Submit
    Then Registration Profile: Choose Supplies: Place Order

    Then Pause for 2 seconds

    Then Health Check: Print - Web Batch

    Then Orders: Visit Sign-in page
    Then Orders: New User Sign-in as random/pass111
    Then Toolbar: Add
    Then Pause for 1 second
    Then Open Settings Modal
    Then Settings:  Set Logoff to 2 hours.
    Then Settings:  Save
    Then Pause for 1 second
    Then Sign out
    Then Registration Profile:  Send username to standard out
    Then Pause for 1 second
