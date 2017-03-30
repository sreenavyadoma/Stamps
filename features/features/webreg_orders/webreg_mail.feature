Feature: First time Mail sign in

  Background:
    Given I launched default browser

    @webreg_mail
    @whats_new
  Scenario: What's new modal
    Then Visit WebReg Registration Page
    Then set WebReg Profile User ID and Email to Random Value

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
    Then set WebReg Membership page Address to 1990 E Grand Avenue
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

    Then On WebReg Membership page, click Submit and correct errors
    Then Registration Choose Supplies: Place Order
    Then Registration: Expect Web Registration result page is either Download page or Webpostage
    Then On WebReg Profile page, Send username to standard out

    Then What's New: Expect modal is present
    Then What's new: Click More Info
    Then More Info: Expect More Info page is present
    Then More Info: Close More Info page
    Then What's New: Click Continue button
    Then Sign out