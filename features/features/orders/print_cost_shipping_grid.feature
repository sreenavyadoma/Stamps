
Feature: Show Cost of Order in Ship Cost Grid

  Background:
    Given I am signed in to Orders using ff

  @print_costs
  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Hide Ship-To fields
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Insure For to $10.00
    Then Order Details: Set Service to "Priority Mail Small Flat Rate Box"
    Then Expect Ship Cost equals Total amount
    And Sign out
