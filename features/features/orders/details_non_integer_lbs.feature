Feature:  B-01998 Reduce UpdateOrder Calls on Order Edit

  Background:
    Given a valid user is signed in to Web Apps

  @details_non_integer_lb
  Scenario: User edits an order

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 5 and 8
    Then on Order Details form, select service PM Flat Rate Envelope
    Then set Order Details form Pounds to 3.5
    Then expect Order Details form Pounds is 3
    Then set Order Details form Pounds to 2.0
    Then expect Order Details form Pounds is 2
    Then set Order Details form Ounces to 6.0
    Then expect Order Details form Ounces is 6.0
    Then Sign out

