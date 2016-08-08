Feature: Registration
  Background:
    Given I launched the default browser

  @registration_pam
  Scenario:
    Then Registration Profile: Load Registration Page
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
    Then Registration Membership: Set Address to 1990 E Grand Avenue
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

    Then Registration Choose Supplies: Place Order

    Then Registration Download Page: Verify download page displays Congratulations on your new account!

    Then PAM: Load Customer Search Page
    Then PAM: Customer Search: Set username to random
    Then PAM: Customer Search: Set 5.2 or lower
    Then PAM: Customer Search: Click Search button
    Then PAM: Customer Search: Verify user is found

    Then PAM: Customer Profile: Click Change Meter Limit link
    Then PAM: Change Meter Limit: Set USPS approval to Checked
    Then PAM: Change Meter Limit: Set New Meter Limit to $100000
    Then PAM: Change Meter Limit: Click Submit
    Then PAM: Customer Profile: Get Available Postage Amount
    Then PAM: Customer Profile: Click ACH Credit link
    Then PAM: ACH Purchase: Set Amount to $100000.00
    Then Pause for 2 seconds
    Then PAM: Customer Profile: Get Available Postage Amount
    Then PAM: Customer Profile: Get Available Postage Amount
    Then PAM: Customer Profile: Click  AppCap Overrides link
    Then PAM: AppCap Overrides: Set Internet Postage Printing to Always On
    Then PAM: AppCap Overrides: Set Netstamps Printing to Always On
    Then PAM: AppCap Overrides: Set Shipping Label Printing to Always On
    Then PAM: AppCap Overrides: Set International Shipping to Always On
    Then PAM: AppCap Overrides: Set Allow High Risk Countries to Always On
    Then PAM: AppCap Overrides: Submit

