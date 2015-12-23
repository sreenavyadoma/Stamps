
Feature: Print Sample

  Background:
    Given I am signed in to Orders

  @print_sample_dev
  Scenario:  B-01625 Print Sample - Priority Mail Express Padded Flat Rate Envelope
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    Then Print Sample
    And Sign out

  @print_sample @print_sample_dev
  Scenario:  B-01625 Print Sample - Parcel Select Ground Large Package
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Service to "Parcel Select Ground Large Package"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    Then Print Sample
    And Sign out

  @print_sample
  Scenario:  B-01625 Print Sample - Priority Mail Regional Rate Box A
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Service to "Priority Mail Regional Rate Box A"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    Then Print Sample
    And Sign out

  @print_sample
  Scenario:  B-01625 Print Sample - Priority Mail Express Package
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Service to "Priority Mail Express Package"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    Then Print Sample

  @print_sample
  Scenario:  B-01625 Print Sample - Priority Mail Flat Rate Envelope
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    Then Print Sample
    And Sign out
