
Feature: Change the starting label position I will print from

  Background:
    Given I am signed in to Orders

  @print_label_position
  Scenario:  Print Label - Left Side
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Open Print Modal
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Expect Print Modal left-side label selected
    Then Toolbar: Print

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Open Print Modal
    Then Print: Set Printer to "factory"
    Then Expect Print Modal left-side label selected
    Then Toolbar: Print

    Then Sign out
