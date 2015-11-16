
Feature: Print Sample

  Background:
    Given I am signed in as batch shipper ff

  @print_sample @print_sample
  Scenario:  B-01625 Print Sample - Parcel Select Large Package

  @print_sample
  Scenario:
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Parcel Select Large Package"
    And Hide Order Details Form Ship-To fields
    Then Print Sample

    And Sign out


  @print_sample
  Scenario:
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Regional Rate Box A"
    And Open Print Modal
    Then Print Sample

    And Sign out


  @print_sample
  Scenario:
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Express Medium Flat Rate Box"
    And Hide Order Details Form Ship-To fields
    Then Print Sample

    And Sign out


  @print_sample
  Scenario:
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Express Package"
    And Hide Order Details Form Ship-To fields
    Then Print Sample


  @print_sample
  Scenario:
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    And Hide Order Details Form Ship-To fields
    Then Print Sample

    And Sign out
