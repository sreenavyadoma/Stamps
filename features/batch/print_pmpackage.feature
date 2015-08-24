@regression
Feature: B-01624 Print Priority Mail Package

  Background:
    Given I am signed in as a batch shipper

  @print
  Scenario:  Print Priority Mail Package
    Given I am signed in as a batch shipper
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Phone to (415) 123-5555
    And Collapse Ship-To Address
    Then Set Service to Priority Mail Package
    Then Print
    And Sign out
