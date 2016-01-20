
Feature: Change the starting label position I will print from

  Background:
    Given I am signed in to Orders

  @print_label_position
  Scenario:  Print Label - Right Side
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Order Details - Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order Details - Set Ounces to 1
    Then Open Print Modal
    Then Print Modal - Set Printer to "factory"
    And Print Modal - Select right-side label
    Then Expect Print Modal right-side label selected
    And Print

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Ounces to 1
    Then Open Print Modal
    Then Print Modal - Set Printer to "factory"
    Then Expect Print Modal right-side label selected
    And Print

    And Sign out
