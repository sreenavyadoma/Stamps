
Feature: Show Cost of Order in Ship Cost Grid

  Background:
    Given I am signed in to Orders

  @grid_ship_cost
  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Set Ounces to 1
    Then Details: Set Insure-For to $10.00
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Expect Ship Cost equals Total amount
    Then Sign out
