
Feature: Print two labels on one sheet

  Background:
    Given I launched browser ff

  @print_two_up_multiple_domestic_labels
  Scenario: User Prints multiple Domestic labels

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 5 through 8
    Then Details: Select Service PM Flat Rate Envelope
    Then Details: Set Weight to 1 lb 1 oz
    Then Details: Set Dimensions to Length 1 Width 1 Height 1
    Then Details: Set Insure-For to $50.25
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service PM Flat Rate Envelope
    Then Details: Set Weight to 1 lb 1 oz
    Then Details: Set Insure-For to $10
    Then Details: Set Tracking to Signature Required

    Then Grid: Check row 2

    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"

    Then Print: Select right-side label
    Then Print: Expect right-side label selected
    Then Print: Print

    Then Pause for 6 seconds
    Then Sign out








