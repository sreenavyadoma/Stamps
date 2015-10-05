
  Feature: Print Sample

  Background:
    Given I am signed in as a batch shipper ff

  @print_sample @print_sample @regression
  Scenario:  B-01625 Print Sample - Parcel Select Large Package

    @print_sample @regression
    Scenario:
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Parcel Select Large Package"
    And Hide single-order form Ship-To fields
    Then Print Sample


    @print_sample @regression
    Scenario:
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Regional Rate Box A"
    And Open Print Modal
    Then Print Sample


    @print_sample
    Scenario:
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Express Medium Flat Rate Box"
    And Hide single-order form Ship-To fields
    Then Print Sample


    @print_sample @regression
    Scenario:
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Express Package"
    And Hide single-order form Ship-To fields
    Then Print Sample


    @print_sample @regression
    Scenario:
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And Hide single-order form Ship-To fields
    Then Print Sample

    And Sign out
