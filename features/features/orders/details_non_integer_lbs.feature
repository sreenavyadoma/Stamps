Feature:  B-01998 Reduce UpdateOrder Calls on Order Edit

  Background:
    Given a valid user is signed in to Web Apps

  @details_non_integer_lb
  Scenario: User edits an order

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Pounds to 3.5
    Then on Order Details form, expect Pounds is 3
    Then on Order Details form, set Pounds to 2.0
    Then on Order Details form, expect Pounds is 2
    Then on Order Details form, set Ounces to 6.0
    Then on Order Details form, expect Ounces is 6.0
    Then Sign out

