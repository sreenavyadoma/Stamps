
Feature: Print two labels on one sheet

  Background:
    Given I launched browser ff

  @print_two_up_multiple_domestic_labels
  Scenario: User Prints multiple Domestic labels

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Weight to 1 lb 1 oz
    Then Order Details: Set Dimensions to Length 1 Width 1 Height 1
    Then Order Details: Set Insure-For to $50.25
    Then Order Details: Set Tracking to Signature Required

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Weight to 1 lb 1 oz
    Then Order Details: Set Insure-For to $10
    Then Order Details: Set Tracking to Signature Required

    Then Orders Grid: Check row 2

    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Set Printer to "factory"

    Then Print Modal: Select right-side label
    Then Print Modal: Expect right-side label selected
    Then Print Modal: Print

    Then Pause for 6 seconds
    Then Sign out








