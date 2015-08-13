@regression
Feature: B-01631 Printing total cost

  Background:
    Given I am signed in as a batch shipper

  @print_costs
  Scenario: B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print
    * Add new order
    * Set Ship From to default
    * Expect Service Cost to be $0.00
    * Expect Insurance Cost to be $0.00
    * Expect Tracking Cost to be $0.00
    * Expect Total to be $0.00

    * Set Ship-To address to random
    * Hide Ship To text area
    * Set Ounces to 1
    * Set Service to Priority Mail Package
    * Set Insured Value to $10.00
    * Set Tracking to Signature Required
    * Expect Total amount equals Service Cost, Insurance Cost and Tracking Cost
    * Sign out
