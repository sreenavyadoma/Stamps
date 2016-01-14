
Feature: Print two labels on one sheet

  Background:
    Given I am signed in to Orders using ff

  @print_two_up @print_two_up_test
  Scenario: User Prints multiple Domestic labels

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Weight to 1 lbs 1 oz

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 5 through 8
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Weight to 1 lbs 1 oz
    Then Set Order Details Dimensions to Length 1 Width 1 Height 1
    Then Set Order Details Insure For to $50.25
    And Set Order Details Tracking to "Signature Required"

    Then Sort Orders Grid by Age in Descending order
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2

    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"

    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Print

    Then Sign out

#todo-rob







