
Feature: Show Cost of Order in Ship Cost Grid

  Background:
    Given a valid user is signed in to Web Apps

  @grid_ship_cost
  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 1
    Then set Order Details form service to PM Small Flat Rate Box
    Then Expect Ship Cost equals Total amount
    Then Sign out
