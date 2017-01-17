Feature: Edit Order Details

  Background:
    Given I am signed in to Orders

  @details_edit_order
  Scenario: User edits an order

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service PM Package
    Then Details: Set Ounces to 3
    Then Details: Set Pounds to 2
    Then Details: Set Insure-For to $100.00
    Then Details: Expect Insure-For Cost is greater than $1
    Then Details: Expect Insure-For is $100
    Then Details: Set Height to 1
    Then Details: Expect Height is 1
    Then Details: Set Length to 1
    Then Details: Expect Length is 1
    Then Details: Set Width to 1
    Then Details: Expect Width is 1

    Then Details: Select Service PM Package
    Then Details: Set Ounces to 2
    Then Details: Expect Ounces is 2
    Then Details: Set Pounds to 1
    Then Details: Expect Pounds is 1
    Then Details: Set Insure-For to $150.00
    Then Details: Expect Insure-For Cost is greater than $1
    Then Details: Expect Insure-For is $100
    Then Details: Set Height to 2
    Then Details: Set Length to 3
    Then Details: Set Width to 4

    Then Details: Expect Service is PM Package
    Then Grid: Expect Ounces is 2
    Then Grid: Expect Pounds is 1
    Then Grid: Expect Insured Value is $150
    Then Sign out
