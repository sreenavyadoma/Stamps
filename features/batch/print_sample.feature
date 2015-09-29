
  Feature: Print Sample

  Background:
    Given I am signed in as a batch shipper ff

  @print_sample @print_sample @regression
  Scenario:  B-01625 Print Sample - Parcel Select Large Package

    @print_sample @regression
    Scenario:
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to "Parcel Select Large Package"
    And Click Ship-To Less link
    Then Print Sample


    @print_sample @regression
    Scenario:
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to "Priority Mail Regional Rate Box A"
    And Open Print Modal
    Then Print Sample


    @print_sample
    Scenario:
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to "Priority Mail Express Medium Flat Rate Box"
    And Click Ship-To Less link
    Then Print Sample


    @print_sample @regression
    Scenario:
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to "Priority Mail Express Package"
    And Click Ship-To Less link
    Then Print Sample


    @print_sample @regression
    Scenario:
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to "Priority Mail Flat Rate Envelope"
    And Click Ship-To Less link
    Then Print Sample

    And Sign out
