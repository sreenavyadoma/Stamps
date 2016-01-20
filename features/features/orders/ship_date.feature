
Feature: Ship Date

  Background:
    Given I am signed in to Orders

  @ship_date
  Scenario:  Print Modal - Set Ship Date to today
    When Add New Order
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Priority Mail Package"
    Then Open Print Modal
    Then Print Modal - Set Ship Date to today
    Then Expect Shipped Tab Ship Date to be today
    Then Print
    And Sign out

  @ship_date
  Scenario:  Print Modal - Set Ship Date to 1 day from today
    When Add New Order
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Priority Mail Package"
    Then Open Print Modal
    Then Print Modal - Set Ship Date to today plus 1
    Then Print Modal - Set Ship Date to today plus 3
    Then Print
    And Sign out

  @ship_date
  Scenario:  Print Modal - Set Ship Date to 1 day from today
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Priority Mail Package"
    Then Open Print Modal
    Then Print Modal - Set Ship Date to today plus 2
    Then Expect Shipped Tab Ship Date to be today plus 2
    Then Print
    And Sign out

  @ship_date
  Scenario:  Print Modal - Set Ship Date to 1 day from today
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Priority Mail Package"
    Then Open Print Modal
    Then Print Modal - Set Ship Date to today plus 3
    Then Expect Shipped Tab Ship Date to be today plus 3
    Then Print
    And Sign out

