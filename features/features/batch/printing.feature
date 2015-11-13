
Feature: Printing

  Background:
    Given I am signed in as a batch shipper ff

  @print @print1
  Scenario:  Print Priority Mail Package
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Package"
    Then Print

    And Sign out

  @print @print_test
  Scenario:  B-01624 Print Priority Mail Express Medium Flat Rate Box
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Form Service to "Priority Mail Express Medium Flat Rate Box"
    Then Print

    And Sign out

  @print @print_test
  Scenario:  Print Priority Mail Express Package
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Form Service to "Priority Mail Express Package"
    Then Print

    And Sign out

  @print
  Scenario:  Print Priority Mail Flat Rate Envelope
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    Then Print

    And Sign out

  @print
  Scenario:  Print Priority Mail Regional Rate Box A
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Regional Rate Box A"
    Then Print

    And Sign out
