
Feature: Show Cost of Order in Ship Cost Grid

  Background:
    Given A user is signed in to Orders

  @grid_ship_cost
  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, set Insure-For to $10.00
    Then On Order Details form, select service PM Small Flat Rate Box
    Then Expect Ship Cost equals Total amount
    Then Sign out
