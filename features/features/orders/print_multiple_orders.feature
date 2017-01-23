
Feature: Print Multiple Orders

  Background:
    Given I am signed in to Orders

  @print_multiple_orders
  Scenario:  Print
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Set Ounces to 1

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Set Ounces to 1

    Then Orders Grid: Check row 1
    Then Orders Grid: Check row 2

    Then Print Modal: Print
    Then Sign out
