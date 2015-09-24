
Feature: Printing total cost

  Background:
    Given I am signed in as a batch shipper ff

  @print_costs @regression
  Scenario: B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print
    And I Add a new order
    Then Set Ship From to default
    Then Expect Service Cost to be $0.00
    Then Expect Insurance Cost to be $0.00
    Then Expect Tracking Cost to be $0.00
    Then Expect Total to be $0.00

    Then Set Ship-To address to random
    And Click Ship-To Less link
    Then Set Ounces to 1
    Then Set Service to Priority Mail Package
    Then Set Insured Value to $10.00
    Then Set Tracking to Signature Required
    Then Expect Total amount equals Service Cost, Insurance Cost and Tracking Cost
    And Sign out
