Feature: Total Cost of Multiple Orders

  Background:
    Given a valid user is signed in to Web Apps

  @multiple_order_total_cost
  Scenario:  Total Cost Multiple Orders
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PM Flat Rate Envelope
    Then set Order Details Pounds to 1
    Then set Order Details Ounces to 1


    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PM Flat Rate Envelope
    Then set Order Details Pounds to 1
    Then set Order Details Ounces to 1

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PM Flat Rate Envelope
    Then set Order Details Pounds to 1
    Then set Order Details Ounces to 1

    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then check Orders Grid row 3


    Then expect Order Details form Multiple Order Total Cost is $17.25


