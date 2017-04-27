Feature: Registration
  Background:
    Given I launched default browser

  @registration_pam_orders
  Scenario:
    Then load Sign-in page
    Then Registration: Load username and password from parameter file
    Then Orders: Sign-in using username and password from parameter file
    Then add new order
    Then Registration: Store username to data file registration_pam_ord
    Then Pause for 5 seconds
    Then On Profile page, Send username to standard out

    Then Sign out

