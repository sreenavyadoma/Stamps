
Feature: Change Starting Label Position to Right Side

  Background:
    Given I am signed in to Orders

  @print_dialog_label_right_side
  Scenario:  Print Label - Right Side
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Ounces to 1
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Select right-side label
    Then Print: Expect right-side label selected
    Then Print: Print

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Select Service Priority Mail Package
    Then Details: Set Ounces to 1
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Expect right-side label selected
    Then Print: Print

    Then Sign out
