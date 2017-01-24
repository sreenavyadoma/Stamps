Feature:  B-01998 Reduce UpdateOrder Calls on Order Edit

  Background:
    Given A user is signed in to Orders

  @details_non_integer_lb
  Scenario: User edits an order

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 5 through 8
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Pounds to 3.5
    Then On Order Details form, expect Pounds is 3
    Then On Order Details form, set Pounds to 2.0
    Then On Order Details form, expect Pounds is 2
    Then On Order Details form, set Ounces to 6.0
    Then On Order Details form, expect Ounces is 6.0
    Then Sign out

