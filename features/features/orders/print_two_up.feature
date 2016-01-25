
Feature: Print two labels on one sheet

  Background:
    Given I am signed in to Orders using ff

  @print_two_up @print_two_up_test
  Scenario: User Prints multiple Domestic labels

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details: Set Weight to 1 lbs 1 oz
    Then Order Details: Set Dimensions to Length 1 Width 1 Height 1
    Then Order Details: Set Insure For to $50.25
    Then Order Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details: Set Weight to 1 lbs 1 oz
    Then Order Details: Set Insure For to $10
    Then Order Details: Set Tracking to "Signature Required"

    Then Orders Grid: Check row 2

    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Set Printer to "factory"

    Then Print Modal: Select right-side label
    Then Expect Print Modal right-side label selected
    Then Toolbar: Print

    Then Sign out

#todo-rob







