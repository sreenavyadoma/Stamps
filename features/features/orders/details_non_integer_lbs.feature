Feature:  B-01998 Reduce UpdateOrder Calls on Order Edit

  Background:
    Given I am signed in to Orders

  @details_non_integer_lbs
  Scenario: User edits an order

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 5 through 8
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Pounds to 3.5
    Then Details: Expect Pounds is 3
    Then Details: Set Pounds to 2.0
    Then Details: Expect Pounds is 2
    Then Details: Set Ounces to 6.0
    Then Details: Expect Ounces is 6.0
    Then Sign out
