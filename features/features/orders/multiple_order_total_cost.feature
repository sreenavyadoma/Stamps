Feature: Total Cost of Multiple Orders

  Background:
    Given a valid user is signed in to Web Apps

  @multiple_order_total_cost
  Scenario:  Total Cost Multiple Orders
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo, CA
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Pounds to 1
    Then set Order Details form Ounces to 1


    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo, CA
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Pounds to 1
    Then set Order Details form Ounces to 1

    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo, CA
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Pounds to 1
    Then set Order Details form Ounces to 1

    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then check Orders Grid row 3


    Then expect Order Details form Multiple Order Total Cost is $17.25


