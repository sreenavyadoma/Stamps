Feature: WebReg
  Background:
    Given I launched default browser

  @orders_first_time_sign_in
  Scenario:
    Then Orders: Visit Sign-in page
    Then WebReg: Load username and password from parameter file
    Then Orders: Sign-in using username and password from parameter file
    Then Toolbar: Add
    Then WebReg: Store username to data file webreg_pam_ord
    Then Pause for 5 seconds
    Then WebReg Profile: Send username to standard out

    Then Sign out

