
Feature: Ship Date

  Background:
    Given I am signed in to Orders

  @ship_date
  Scenario:  Set Print Modal Ship Date to today
    And I Add a new order
    Then Set Order Details Ship-To address to random
    Then Set Order Details Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Print Modal Ship Date to today
    Then Expect Shipped Tab Ship Date to be today
    Then Print
    And Sign out

  @ship_date
  Scenario:  Set Print Modal Ship Date to 1 day from today
    And I Add a new order
    Then Set Order Details Ship-To address to random
    Then Set Order Details Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Print Modal Ship Date to today plus 1
    Then Set Print Modal Ship Date to today plus 3
    Then Print
    And Sign out

  @ship_date
  Scenario:  Set Print Modal Ship Date to 1 day from today
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random
    Then Set Order Details Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Print Modal Ship Date to today plus 2
    Then Expect Shipped Tab Ship Date to be today plus 2
    Then Print
    And Sign out

  @ship_date
  Scenario:  Set Print Modal Ship Date to 1 day from today
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random
    Then Set Order Details Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Print Modal Ship Date to today plus 3
    Then Expect Shipped Tab Ship Date to be today plus 3
    Then Print
    And Sign out

