
Feature: Print Multiple Orders

  Background:
    Given a valid user is signed in to Web Apps

  @print_multiple_orders
  Scenario:  Print
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details ounces to 1

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details ounces to 1

    Then check row 1
    Then check row 2

    Then click print modal print button
    Then sign out
