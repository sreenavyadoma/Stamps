Feature: WebReg
  Background:
    Given I launched default browser

  @webreg_orders_sign_in
  Scenario:
    Then Orders: Visit Sign-in page
    #Then Orders: Sign-in as new user random/pass111
    Then Orders: Expect Marketplace modal is present
    Then Orders: Close Marketplace modal
    Then Toolbar: Add
    Then Pause for 3 seconds
    Then Sign out
    Then WebReg Profile: Send username to standard out

