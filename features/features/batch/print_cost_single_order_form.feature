
Feature: Printing total cost

  Background:
    Given I am signed in as a batch shipper ff

  @print_costs
  Scenario: B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print
    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Expect Service Cost to be $0.00
    Then Expect Insurance Cost to be $0.00
    Then Expect Tracking Cost to be $0.00
    Then Expect Order Form Total to be $0.00

    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 1
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Insured Value to $10.00
    Then Set Order Form Tracking to "Signature Required"
    Then Expect Total amount equals Service Cost, Insurance Cost and Tracking Cost
    And Sign out
