Feature:  B-01998 Reduce UpdateOrder Calls on Order Edit

  Background:
    Given I am signed in to Orders

  @details_non_integer_lb
  Scenario: User edits an order

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Pounds to 3.5
    Then Order Details: Expect Pounds is 3
    Then Order Details: Set Pounds to 2.0
    Then Order Details: Expect Pounds is 2
    Then Order Details: Set Ounces to 6.0
    Then Order Details: Expect Ounces is 6.0
    Then Sign out

