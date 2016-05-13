Feature: "Country" grid column should appear to left of "Address" column by default

  Background:
    Given WebReg: Load Registration Page

  @grid_column_order
  Scenario: Column Order
    Then WebReg: Set User ID and Email to Random Value

    Then WebReg: Set Password to pass111
    Then WebReg: Set Re-Type password to pass111
    Then WebReg: Set How will you use Stamps.com to Both Mailing and Shipping
    Then WebReg: Set Referrer Name to Already used in office
    Then WebReg: Set 1st Question to What is your mother's maiden name
    Then WebReg: Set 1st Answer to stamps
    Then WebReg: Set 2nd Question to What was your high school mascot
    Then WebReg: Set 2nd Answer to stamps

    Then WebReg: Continue to Mailing Information Page
    Then WebReg: Set Mailing Info First Name to random
    Then WebReg: Set Mailing Info Last Name to random
    Then WebReg: Set Mailing Info Company to random
    Then WebReg: Set Mailing Info Address to 1990 E Grand Avenue
    Then WebReg: Set Mailing Info City to El Segundo
    Then WebReg: Set Mailing Info State to California
    Then WebReg: Set Mailing Info Zip Code to 90245
    Then WebReg: Set Mailing Info Phone to random
    Then WebReg: Set Mailing Info Extenion to random

    Then WebReg: Set Mailing Info Cardholder name to random
    Then WebReg: Set Mailing Info Card number to 4111111111111111
    Then WebReg: Set Mailing Info Expiration Month to February
    Then WebReg: Set Mailing Info Expiration Year to 2019
    Then WebReg: Set Mailing Info Billing address same as mailing address to Checked
    Then WebReg: Set Mailing Info Terms & Conditions to Checked

    Then Pause for 1 second
    Then WebReg: Mailing Info Submit
    Then Pause for 2 seconds
    Then WebReg: Choose Supplies: Place Order

    Then PAM: Customer Search: Search for username random

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

    Then Health Check: Verify Server Health

    Then Pause for 2 seconds
    Then Orders: Load Sign-in page
    Then Orders: First Time Sign-in to Orders as random/pass111
    Then Pause for 2 seconds
    Then Toolbar: Add
    Then Pause for 1 second
    Then Open Settings Modal
    Then Settings:  Set Logoff to 2 hours.
    Then Settings:  Save
    Then Pause for 2 seconds
    Then Navigation Bar: Customer Balance

    Then Grid: Expect Column Country appears to left of Address

    Then Sign out
    Then WebReg:  Send username to standard out




