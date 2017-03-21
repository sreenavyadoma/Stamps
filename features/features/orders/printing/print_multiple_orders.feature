
Feature: Print Multiple Orders

  Background:
    Given a valid user is signed in to Web Apps

  @print_multiple_orders
  Scenario:  Print
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then set Order Details form Ounces to 1

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then set Order Details form Ounces to 1

    Then in Orders Grid, check row 1
    Then in Orders Grid, check row 2

    Then in Print modal, click Print button
    Then Sign out
