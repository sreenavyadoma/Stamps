Feature: Rates for Core User in Zone 1

  Background:
    Given Rates: Load Rate File

  @rates_pme_comm_base
  Scenario: PME Comm Base
    And I am signed in to Orders
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Rates: Test PME Comm Base in Zone 1
    Then Rates: Test PME Comm Base in Zone 8
    Then Rates: Number of failed test should be less than 1000
    Then Sign out

