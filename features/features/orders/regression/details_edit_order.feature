Feature: Edit Order Details

  Background:
    Given a valid user is signed in to Web Apps

  @details_edit_order
  Scenario: User edits an order

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address in zone 8
    Then on Order Details form, select service PM Package
    Then set Order Details form Ounces to 3
    Then set Order Details form Pounds to 2
    Then set Order Details form Insure-For to $100.00
    Then expect Order Details form Insure-For Cost is greater than $1
    Then expect Order Details form Insure-For is 100
    Then set Order Details form Height to 1
    Then expect Order Details form Height is 1
    Then set Order Details form Length to 1
    Then expect Order Details form Length is 1
    Then set Order Details form Width to 1
    Then expect Order Details form Width is 1

    Then on Order Details form, select service PM Package
    Then set Order Details form Ounces to 2
    Then expect Order Details form Ounces is 2
    Then set Order Details form Pounds to 1
    Then expect Order Details form Pounds is 1
    Then set Order Details form Insure-For to $150
    Then expect Order Details form Insure-For Cost is greater than $1
    Then expect Order Details form Insure-For is 150
    Then set Order Details form Height to 2
    Then set Order Details form Length to 3
    Then set Order Details form Width to 4

    Then Sign out
