
Feature: Registration
  Background:
    Given WebReg: Load Registration Page

  Scenario:
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
    Then WebReg: Set Mailing Info Address to 1990 E. Grand Ave.
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

    Then WebReg: Mailing Info Submit
    Then WebReg: Choose Supplies: Place Order

    Then Pause for 2 seconds

    Then Healthcheck: Get Info

    Then Orders: Load Sign-in page
    Then Orders: First Time Sign-in to Orders as random/pass111
    Then Toolbar: Add
    Then Pause for 1 second
    Then Open Settings Modal
    Then Settings:  Set Logoff to 2 hours.
    Then Settings:  Save
    Then Pause for 1 second
    Then Sign out
    Then WebReg:  Send username to standard out
    Then Pause for 1 second
    #Then Grid:  Order ID: Column: Check Reference Number
    #Then Grid: Order ID: Sort Ascending
