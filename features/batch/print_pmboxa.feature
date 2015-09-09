@regression
Feature: B-01624 Print Priority Mail Regional Rate Box A

  Background:
    Given I am signed in as a batch shipper

  @print_pmrrboxa @print
  Scenario:  Print Priority Mail Regional Rate Box A
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Phone to (415) 123-5555
    And Collapse Ship-To Address
    Then Set Service to Priority Mail Regional Rate Box A

    Then Select
    Then Print
    And Sign out
