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
    Then Sign out
    Then WebReg Profile: Send username to standard out

