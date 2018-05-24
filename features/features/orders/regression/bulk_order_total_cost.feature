Feature: Total Cost of Multiple Orders

  Background:
    Given a valid user is signed in to Web Apps

  @multiple_order_total_cost
  Scenario:  Total Cost Multiple Orders
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details service to PM Flat Rate Envelope
    Then set order details pounds to 1
    Then set order details ounces to 1


    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details service to PM Flat Rate Envelope
    Then set order details pounds to 1
    Then set order details ounces to 1

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details service to PM Flat Rate Envelope
    Then set order details pounds to 1
    Then set order details ounces to 1

    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then check Orders Grid row 3


    Then expect Order Details Multiple Order Total Cost is $19.65


