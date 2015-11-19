
Feature: Ship Date

  Background:
    Given I am signed in as a batch shipper

  @ship_date
  Scenario:  Set Print Modal Ship Date to today
    And I Add a new order
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Ship Date Picker to 0 day(s) from today
    Then Expect Print Window Ship Date to be 0 day(s) from today
    Then Print
    And Sign out

  @ship_date
  Scenario:  Set Print Modal Ship Date to 1 day from today
    And I Add a new order
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Ship Date Picker to 1 day(s) from today
    Then Expect Print Window Ship Date to be 1 day(s) from today
    Then Print
    And Sign out

  @ship_date
  Scenario:  Set Print Modal Ship Date to 1 day from today
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Ship Date Picker to 2 day(s) from today
    Then Expect Print Window Ship Date to be 2 day(s) from today
    Then Print
    And Sign out

  @ship_date
  Scenario:  Set Print Modal Ship Date to 1 day from today
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Ship Date Picker to 3 day(s) from today
    Then Expect Print Window Ship Date to be 3 day(s) from today
    Then Print
    And Sign out

