Feature: WebReg
  Background:
    Given I launched default browser

  @webreg_meter_limit_100k
  Scenario:
    Then Visit WebReg Registration Page
    Then set WebReg Profile User ID and Email to random
    Then On WebReg Profile page, Send username to standard out
    Then set WebReg Profile Password to pass111
    Then set WebReg Profile Re-Type password to pass111
    Then set WebReg Profile How will you use Stamps.com to Both Mailing and Shipping
    Then set WebReg Profile Referrer Name to Already used in office
    Then set WebReg Profile 1st Question to What is your mother's maiden name
    Then set WebReg Profile 1st Answer to stamps
    Then set WebReg Profile 2nd Question to What was your high school mascot
    Then set WebReg Profile 2nd Answer to stamps

    Then On WebReg Profile page, continue to Mailing Information page
    Then set WebReg Membership page First Name to random
    Then set WebReg Membership page Last Name to random
    Then set WebReg Membership page Company to random
    Then set WebReg Membership page Address to 1990 East Grand Avenue
    Then set WebReg Membership page City to El Segundo
    Then set WebReg Membership page State to California
    Then set WebReg Membership page Zip Code to 90245
    Then set WebReg Membership page Phone to random
    Then set WebReg Membership page Extenion to random

    Then set WebReg Membership page Cardholder name to random
    Then set WebReg Membership page Card number to 4111111111111111
    Then set WebReg Membership page Expiration Month to February
    Then set WebReg Membership page Expiration Year to 2019
    Then set WebReg Membership page Billing address same as mailing address to Checked
    Then set WebReg Membership page Terms & Conditions to Checked

    Then On WebReg Membership page, click Submit
    Then WebReg: Save username and password to parameter file webreg_meter_limit_100k
    Then WebReg: Store username to data file webreg_meter_limit_100k
    Then On WebReg Profile page, Send username to standard out
