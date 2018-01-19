
Feature: Print Multiple Orders

  Background:
    Given a valid user is signed in to Web Apps

  @print_multiple_orders
  Scenario:  Print
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set Order Details Ounces to 1

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set Order Details Ounces to 1

    Then check Orders Grid row 1
    Then check Orders Grid row 2

    Then click print modal print button
    Then Sign out
