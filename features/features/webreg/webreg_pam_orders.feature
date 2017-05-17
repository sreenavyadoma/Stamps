Feature: Registration
  Background:
    Given I launched default browser

  @registration_pam_orders
  Scenario:
    Then load Web Apps Sign-in page
    Then load username and password from parameter file
    Then Orders: Sign-in using username and password from parameter file
    Then add new order
    Then store username to data file registration_pam_ord
    Then Pause for 5 seconds
    Then send username to standard out

    Then Sign out

