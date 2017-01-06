Feature: PME Comm Plus

  Background:
    Given Rates: Load Rate File

  @rates_pme_comm_plus
  Scenario: PME Comm Plus
    And I am signed in to Orders
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Rates: Test PME Comm Plus in Zone 1
    Then Rates: Test PME Comm Plus in Zone 9
    Then Rates: Number of failed test should be less than 100
    Then Sign out

