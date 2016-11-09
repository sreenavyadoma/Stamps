Feature: WebReg
  Background:
    Given I launched default browser

  @webreg_orders
  Scenario:
    Then Orders: Visit Sign-in page
    Then Orders: Sign in using Jenkins web reg credentials
    Then Toolbar: Add
    Then Pause for 3 seconds
    Then Sign out
    Then WebReg Profile: Send username to standard out

