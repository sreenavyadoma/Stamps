
Feature:  BVT - Printing

  Background:
    Given I am signed in as a batch shipper

  @bvt_printing
  Scenario:  Printing
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to Priority Mail Package
    Then Print
    And Sign out
