
Feature: Print Label Position

  Background:
    Given I am signed in as a batch shipper ff

  @print_labels @print
  Scenario:  B-01633 Change the starting label position I will print from - Print Left Side
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Service to "Priority Mail Package"
    And Open Print Modal
    And Select left side label
    Then Expect left side label selected
    And Print
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Service to "Priority Mail Package"
    And Open Print Modal
    Then Expect left side label selected
    And Print

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Service to "Priority Mail Package"
    And Open Print Modal
    And Select right side label
    Then Expect right side label selected
    And Print
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Service to "Priority Mail Package"
    And Open Print Modal
    Then Expect right side label selected
    And Print

    And Sign out
