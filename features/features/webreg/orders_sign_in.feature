Feature: WebReg
  Background:
    Given I launched default browser

  @orders_sign_in
  Scenario:
    Then Orders: Visit Sign-in page
    Then Orders: Sign in using Jenkins web reg credentials
    Then Toolbar: Add
    Then WebReg PAM Orders: Write username to properties file
    Then Pause for 5 seconds

    Then Buy Mail: Purchase 10
    Then Buy Mail: Click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $10.00 postage purchase.
    Then Buy Mail Confirm Purchase: Click Purchase button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $10.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $10

    Then WebReg Profile: Send username to standard out

    Then Sign out

