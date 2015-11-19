
Feature: Ship Date

  Background:
    Given I am signed in as a batch shipper

  @ship_date
  Scenario:  Set Print Modal Ship Date to today
    And I Add a new order
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Print Modal Ship Date to today
    Then Expect Shipped Tab Ship Date to be today
    Then Print
    And Sign out

  @ship_date
  Scenario:  Set Print Modal Ship Date to 1 day from today
    And I Add a new order
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Print Modal Ship Date to today plus one day
    Then Expect Shipped Tab Ship Date to be today plus one
    Then Print
    And Sign out

  @ship_date
  Scenario:  Set Print Modal Ship Date to 1 day from today
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Print Modal Ship Date to today plus two days
    Then Expect Shipped Tab Ship Date to be today plus two
    Then Print
    And Sign out

  @ship_date
  Scenario:  Set Print Modal Ship Date to 1 day from today
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Print Modal Ship Date to today plus three days
    Then Expect Shipped Tab Ship Date to be today plus three
    Then Print
    And Sign out

