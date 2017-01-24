Feature: PM Comm Base Rates

  Background:
    Given Rates: Load Rate File

  @rates_pm_comm_base
  Scenario: PM Comm Base
    And A user is signed in to Orders
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then Rates: Test PM Comm Base in Zone 1
    Then Rates: Test PM Comm Base in Zone 2
    Then Rates: Test PM Comm Base in Zone 3
    Then Rates: Test PM Comm Base in Zone 4
    Then Rates: Test PM Comm Base in Zone 5
    Then Rates: Test PM Comm Base in Zone 6
    Then Rates: Test PM Comm Base in Zone 7
    Then Rates: Test PM Comm Base in Zone 8
    Then Rates: Test PM Comm Base in Zone 9
    Then Rates: Number of failed test should be less than 1
    Then Sign out

