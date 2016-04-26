
Feature: Print Multiple Orders

  Background:
    Given I am signed in to Orders

  @print_multiple_orders
  Scenario:  Print
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Ounces to 1

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Ounces to 1

    Then Grid: Check row 1
    Then Grid: Check row 2

    Then Print: Print
    Then Sign out
