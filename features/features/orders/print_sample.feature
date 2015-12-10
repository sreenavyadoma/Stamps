
Feature: Print Sample

  Background:
    Given I am signed in to Orders

  @print_sample
  Scenario:  B-01625 Print Sample - Parcel Select Large Package

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random
    Then Set Order Details Service to "Parcel Select Large Package"

    Then Set Order Details Ounces to 1
    And Open Print Modal
    Then Print Sample

    And Sign out


  @print_sample
  Scenario:  B-01625 Print Sample - Priority Mail Regional Rate Box A
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random
    Then Set Order Details Service to "Priority Mail Regional Rate Box A"
    Then Set Order Details Ounces to 1
    And Open Print Modal
    Then Print Sample

    And Sign out


  @print_sample
  Scenario:  B-01625 Print Sample - Priority Mail Express Medium Flat Rate Box
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random
    Then Set Order Details Service to "Priority Mail Express Medium Flat Rate Box"
    Then Set Order Details Ounces to 1
    And Hide Order Details Form Ship-To fields
    Then Print Sample

    And Sign out


  @print_sample
  Scenario:  B-01625 Print Sample - Priority Mail Express Package
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random
    Then Set Order Details Service to "Priority Mail Express Package"
    Then Set Order Details Ounces to 1
    And Hide Order Details Form Ship-To fields
    Then Print Sample


  @print_sample
  Scenario:  B-01625 Print Sample - Priority Mail Flat Rate Envelope
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Hide Order Details Form Ship-To fields
    Then Print Sample

    And Sign out
