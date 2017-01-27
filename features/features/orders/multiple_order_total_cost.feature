Feature: Total Cost of Multiple Orders

  Background:
    Given a valid user is signed in to Web Apps

  @multiple_order_total_cost
  Scenario:  Total Cost Multiple Orders
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, set Ounces to 1


    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, set Ounces to 1

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, set Ounces to 1

    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then In Orders Grid, check row 3


    Then On Order Details form, expect Multiple Order Total Cost is $17.25


