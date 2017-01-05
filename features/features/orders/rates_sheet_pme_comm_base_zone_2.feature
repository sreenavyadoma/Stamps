Feature: Rates for Core User in Zone 1

  Background:
    Given Rates: Load PME Comm Base Test Sheet

  @rates_sheet_pme_comm_base_zone_2
  Scenario: PME Comm Base Zone 1
    And I am signed in to Orders
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1
    Then Rates: Test PME Comm Base
    Then Sign out

