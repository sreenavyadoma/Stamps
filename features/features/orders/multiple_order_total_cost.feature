Feature: Total Cost of Multiple Orders

  Background:
    Given a valid user is signed in to Web Apps

  @multiple_order_total_cost
  Scenario:  Total Cost Multiple Orders
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then on Order Details form, select service PM Flat Rate Envelope
    Then set Order Details form Pounds to 1
    Then set Order Details form Ounces to 1


    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then on Order Details form, select service PM Flat Rate Envelope
    Then set Order Details form Pounds to 1
    Then set Order Details form Ounces to 1

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then on Order Details form, select service PM Flat Rate Envelope
    Then set Order Details form Pounds to 1
    Then set Order Details form Ounces to 1

    Then in Orders Grid, check row 1
    Then in Orders Grid, check row 2
    Then in Orders Grid, check row 3


    Then expect Order Details form Multiple Order Total Cost is $17.25


