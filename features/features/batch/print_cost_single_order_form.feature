
Feature: Printing total cost

  Background:
    Given I am signed in as batch shipper ff

  @print_costs
  Scenario: B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Expect Service Cost to be $0.00
    Then Expect Insurance Cost to be $0.00
    Then Expect Tracking Cost to be $0.00
    Then Expect Order Details Form Total to be $0.00

    Then Set Order Details Form Ship-To address to random
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Form Ounces to 1
    Then Set Order Details Form Service to "Priority Mail Package"
    Then Set Order Details Form Insured Value to $10.00
    Then Set Order Details Form Tracking to "Signature Required"
    Then Expect Total amount equals Service Cost, Insurance Cost and Tracking Cost
    And Sign out
