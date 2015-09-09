@regression
Feature: B-01624 Print Priority Mail Express Package

  Background:
    Given I am signed in as a batch shipper

  @print
  Scenario:  Print Priority Mail Express Package
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Phone to (415) 123-5555
    And Click Ship-To Less link
    Then Set Service to Priority Mail Express Package
    Then Print
    And Sign out
