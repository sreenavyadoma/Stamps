
Feature: Printing total cost

  Background:
    Given I am signed in to Orders as ff

  @print_costs @print_costs_dev
  Scenario: B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Expect Service Cost to be $0.00
    Then Expect Insurance Cost to be $0.00
    Then Expect Tracking Cost to be $0.00
    Then Expect Order Details Total to be $0.00

    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Ounces to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Insured Value to $10.00
    Then Set Order Details Tracking to "Signature Required"
    Then Expect Total amount equals Service Cost, Insurance Cost and Tracking Cost
    And Sign out
