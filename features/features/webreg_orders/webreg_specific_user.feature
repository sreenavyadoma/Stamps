
Feature: WebReg
  Background:
    Given Visit WebReg Registration Page

  @webreg_specify_username
  Scenario:
    Then set WebReg Profile User ID and Email to ss_new2

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
    Then set WebReg Membership page Address to 1990 E. Grand Ave.
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

    Then Visit PAM Customer Search page
    Then set PAM Customer Search page username to random
    Then set PAM Customer Search page 5.2 or lower
    Then On PAM Customer Search page, click Search button

    Then On PAM Customer Profile page, click Change Meter Limit link
    Then On PAM Change Meter Limit page, set USPS approval to Checked
    Then On PAM Change Meter Limit page, set New Meter Limit to $100000
    Then On PAM Change Meter Limit page, click Submit

    Then On PAM Customer Profile page, click ACH Credit link
    Then On PAM Customer Profile page, get Available Mail Amount
    Then On PAM Customer Profile page, get Available Mail Amount
    Then On PAM ACH Purchase page, set Amount to $100000.00
    Then On PAM Customer Profile page, get Available Mail Amount
    Then On PAM Customer Profile page, get Available Mail Amount

    Then On PAM Customer Profile page, click  AppCap Overrides link
    Then On PAM AppCap Overrides page, set Internet Mail Printing to Always On
    Then On PAM AppCap Overrides page, set Netstamps Printing to Always On
    Then On PAM AppCap Overrides page, set Shipping Label Printing to Always On
    Then On PAM AppCap Overrides page, set International Shipping to Always On
    Then On PAM AppCap Overrides page, set Allow High Risk Countries to Always On
    Then On PAM AppCap Overrides page, Submit

    Then Health Check: Print - Web Batch

    Then load Sign-in page
    Then Orders: Sign-in as new user ss_sctest_b4/password1
    Then Pause for 2 seconds
    Then click Orders Toolbar Add button
    Then Pause for 1 second
    Then Open Settings Modal
    Then In Settings modal, set Logoff to 2 hours
    Then In Settings modal, Save
    Then Navigation Bar: Customer Balance
    Then Navigation Bar: Wait while balance less than 5000
    Then Sign out
    Then On WebReg Profile page, Send username to standard out
    Then Pause for 1 second
