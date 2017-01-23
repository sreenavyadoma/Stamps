Feature: Edit Order Details

  Background:
    Given I am signed in to Orders

  @details_edit_order
  Scenario: User edits an order

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PM Package
    Then Order Details: Set Ounces to 3
    Then Order Details: Set Pounds to 2
    Then Order Details: Set Insure-For to $100.00
    Then Order Details: Expect Insure-For Cost is greater than $1
    Then Order Details: Expect Insure-For is $100
    Then Order Details: Set Height to 1
    Then Order Details: Expect Height is 1
    Then Order Details: Set Length to 1
    Then Order Details: Expect Length is 1
    Then Order Details: Set Width to 1
    Then Order Details: Expect Width is 1

    Then Order Details: Select Service PM Package
    Then Order Details: Set Ounces to 2
    Then Order Details: Expect Ounces is 2
    Then Order Details: Set Pounds to 1
    Then Order Details: Expect Pounds is 1
    Then Order Details: Set Insure-For to $150
    Then Order Details: Expect Insure-For Cost is greater than $1
    Then Order Details: Expect Insure-For is $150
    Then Order Details: Set Height to 2
    Then Order Details: Set Length to 3
    Then Order Details: Set Width to 4

    Then Sign out
