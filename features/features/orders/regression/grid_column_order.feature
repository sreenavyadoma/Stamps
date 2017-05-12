Feature: "Country" grid column should appear to left of "Address" column by default

  Background:
    Given I loaded default registration profile page

  @grid_column_order
  Scenario: Column Order
    Then set Profile User ID and Email to Random Value

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
    Then set Registration Membership page Address to 1990 E Grand Avenue
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

    Then On Registration Membership page, click Submit and correct errors

    Then Pause for 2 seconds
    Then Registration Choose Supplies: Place Order

    Then Visit PAM Customer Search page
    Then set PAM Customer Search page username to random
    Then set PAM Customer Search page 5.2 or lower
    Then On PAM Customer Search page, click Search button

    Then On PAM Customer Profile page, click Change Meter Limit link
    Then On PAM Change Meter Limit page, set USPS approval to Checked
    Then On PAM Change Meter Limit page, set New Meter Limit to $100000
    Then On PAM Change Meter Limit page, click Submit
    Then On PAM Customer Profile page, get Available Mail Amount
    Then On PAM Customer Profile page, click ACH Credit link
    Then On PAM ACH Purchase page, set Amount to $100000.00
    Then Pause for 2 seconds
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

    Then Pause for 2 seconds
    Then load Web Apps Sign-in page
    Then Orders: Sign-in as new user random/pass111
    Then Pause for 2 seconds
    Then add new order
    Then Pause for 1 second
    Then Open Settings Modal
    Then In Settings modal, set Logoff to 2 hours
    Then In Settings modal, Save
    Then Pause for 2 seconds
    Then Navigation Bar: Customer Balance

    Then expect Orders Grid Column Country appears to left of Address

    Then Sign out
    Then send username to standard out





