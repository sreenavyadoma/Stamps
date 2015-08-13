@regression
Feature: B-01743 Show Cost of Order in Ship Cost Grid

  Background:
    Given I am signed in as a batch shipper

  @print_costs
  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Hide Ship To text area
    * Set Ounces to 1
    * Set Insured Value to $10.00
    * Set Service to Priority Mail Package
    * Expect Ship Cost equals Total amount
    * Sign out
