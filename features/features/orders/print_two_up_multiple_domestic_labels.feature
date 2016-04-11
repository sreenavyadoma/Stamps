
Feature: Print two labels on one sheet

  Background:
    Given I am signed in to Orders using ff

  @print_two_up_multiple_domestic_labels
  Scenario: User Prints multiple Domestic labels

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Details: Set Weight to 1 lbs 1 oz
    Then Details: Set Dimensions to Length 1 Width 1 Height 1
    Then Details: Set Insure-For to $50.25
    Then Details: Set Tracking to "Signature Required"

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Details: Set Weight to 1 lbs 1 oz
    Then Details: Set Insure-For to $10
    Then Details: Set Tracking to "Signature Required"

    Then Grid: Check row 2

    Then Print: Open Modal
    Then Print: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"

    Then Print: Select right-side label
    Then Expect Print Modal right-side label selected
    Then Print: Print

    Then Pause for 6 seconds
    Then Sign out








