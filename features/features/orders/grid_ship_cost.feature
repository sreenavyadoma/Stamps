
Feature: Show Cost of Order in Ship Cost Grid

  Background:
    Given I am signed in to Orders

  @grid_ship_cost
  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Insure-For to $10.00
    Then Order Details: Select Service PM Small Flat Rate Box
    Then Expect Ship Cost equals Total amount
    Then Sign out
