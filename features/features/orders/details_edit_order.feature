Feature:  B-01998 Reduce UpdateOrder Calls on Order Edit

  Background:
    Given I am signed in to Orders

  @details_edit_order
  Scenario: User edits an order

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 5 through 8
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Ounces to 3
    Then Details: Set Pounds to 2
    Then Details: Set Insure-For to $1.00
    Then Details: Set Height to 1
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Grid: Check row 1
    Then Grid: Check row 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Ounces to 2
    Then Details: Set Pounds to 1
    Then Details: Set Insure-For to $11.00
    Then Details: Set Height to 2
    Then Details: Set Length to 3
    Then Details: Set Width to 4
    Then Grid: Check row 1
    Then Grid: Check row 1
    Then Details: Expect Service is Priority Mail Package
    Then Grid: Expect Ounces is 2
    Then Grid: Expect Pounds is 1
    Then Grid: Expect Insured Value is $11.00
    Then Sign out
