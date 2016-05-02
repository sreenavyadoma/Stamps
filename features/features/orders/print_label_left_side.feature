
Feature: Change Starting Label Position to Left Side

  Background:
    Given I am signed in to Orders

  @print_label_left_side
  Scenario:  Print Label - Left Side
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Ounces to 1
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Expect Print Modal left-side label selected
    Then Print: Print

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Ounces to 1
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Expect Print Modal left-side label selected
    Then Print: Print

    Then Sign out
