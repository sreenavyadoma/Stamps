Feature: PME Comm Base Rates

  Background:
    Given excel rate sheet is loaded

  @rates_pme_comm_base
  Scenario: PME Comm Base
    And a valid user is signed in to Web Apps
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then run rate test PME Comm Base in Zone 1
    Then run rate test PME Comm Base in Zone 2
    Then run rate test PME Comm Base in Zone 3
    Then run rate test PME Comm Base in Zone 4
    Then run rate test PME Comm Base in Zone 5
    Then run rate test PME Comm Base in Zone 6
    Then run rate test PME Comm Base in Zone 7
    Then run rate test PME Comm Base in Zone 8
    Then run rate test PME Comm Base in Zone 9
    Then Rates: Number of failed test should be less than 1
    Then Sign out

