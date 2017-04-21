Feature: Registration
  Background:
    Given I launched default browser

  @registration_meter_limit_100k
  Scenario:
    Then I loaded default registration profile page
    Then set Profile User ID and Email to random
    Then On Profile page, Send username to standard out
    Then set Profile Password to pass111
    Then set Profile Re-Type password to pass111
    Then set Profile How will you use Stamps.com to Both Mailing and Shipping
    Then set Profile Referrer Name to Already used in office
    Then set Profile 1st Question to What is your mother's maiden name
    Then set Profile 1st Answer to stamps
    Then set Profile 2nd Question to What was your high school mascot
    Then set Profile 2nd Answer to stamps

    Then On Profile page, continue to Mailing Information page
    Then set Registration Membership page First Name to random
    Then set Registration Membership page Last Name to random
    Then set Registration Membership page Company to random
    Then set Registration Membership page Address to 1990 East Grand Avenue
    Then set Registration Membership page City to El Segundo
    Then set Registration Membership page State to California
    Then set Registration Membership page Zip Code to 90245
    Then set Registration Membership page Phone to random
    Then set Registration Membership page Extenion to random

    Then set Registration Membership page Cardholder name to random
    Then set Registration Membership page Card number to 4111111111111111
    Then set Registration Membership page Expiration Month to February
    Then set Registration Membership page Expiration Year to 2019
    Then set Registration Membership page Billing address same as mailing address to Checked
    Then set Registration Membership page Terms & Conditions to Checked

    Then On Registration Membership page, click Submit
    Then Registration: Save username and password to parameter file registration_meter_limit_100k
    Then Registration: Store username to data file registration_meter_limit_100k
    Then On Profile page, Send username to standard out
