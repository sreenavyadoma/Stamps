  @regression
  Feature: B-01625  Print Sample Parcel Select Large Package

  Background:
    Given I am signed in as a batch shipper

  @print_sample
  Scenario:  Print Sample - Parcel Select Large Package

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to Parcel Select Large Package
    And Collapse Ship-To Address
    Then Print Sample

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to Priority Mail Regional Rate Box A
    And Open Print Modal
    Then Print Sample

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to Priority Mail Express Medium Flat Rate Box
    And Collapse Ship-To Address
    Then Print Sample

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to Priority Mail Express Package
    And Collapse Ship-To Address
    Then Print Sample

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to Priority Mail Flat Rate Envelope
    And Collapse Ship-To Address
    Then Print Sample

    And Sign out
