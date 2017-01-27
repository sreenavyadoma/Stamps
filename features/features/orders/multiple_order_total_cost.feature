Feature: Total Cost of Multiple Orders

  Background:
    Given a valid user is signed in to Web Apps

  @multiple_order_total_cost
  Scenario:  Total Cost Multiple Orders
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, set Ounces to 1


    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, set Ounces to 1

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, set Ounces to 1

    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then In Orders Grid, check row 3


    Then on Order Details form, expect Multiple Order Total Cost is $17.25


