
Feature: Change the starting label position I will print from

  Background:
    Given I am signed in to Orders

  @print_label_position @print_label_position_right_side
  Scenario:  Print Label - Right Side
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Hide Ship-To fields
    Then Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order Details: Set Ounces to 1
    Then Open Print Modal
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Select right-side label
    Then Expect Print Modal right-side label selected
    Then Toolbar: Print

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Hide Ship-To fields
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Ounces to 1
    Then Open Print Modal
    Then Print Modal: Set Printer to "factory"
    Then Expect Print Modal right-side label selected
    Then Toolbar: Print

    Then Sign out
