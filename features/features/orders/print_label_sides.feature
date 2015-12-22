
Feature: Print Label Position

  Background:
    Given I am signed in to Orders

  @print_labels @print
  Scenario:  B-01633 Change the starting label position I will print from - Print Left Side
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Open Print Modal
    And Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    And Print
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Open Print Modal
    Then Expect Print Modal left-side label selected
    And Print

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Open Print Modal
    And Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    And Print
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 1
    And Open Print Modal
    Then Expect Print Modal right-side label selected
    And Print

    And Sign out
