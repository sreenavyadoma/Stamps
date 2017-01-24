Feature: Edit Order Details

  Background:
    Given A user is signed in to Orders

  @details_edit_order
  Scenario: User edits an order

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 8
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Ounces to 3
    Then On Order Details form, set Pounds to 2
    Then On Order Details form, set Insure-For to $100.00
    Then On Order Details form, expect Insure-For Cost is greater than $1
    Then On Order Details form, expect Insure-For is $100
    Then On Order Details form, set Height to 1
    Then On Order Details form, expect Height is 1
    Then On Order Details form, set Length to 1
    Then On Order Details form, expect Length is 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, expect Width is 1

    Then On Order Details form, select service PM Package
    Then On Order Details form, set Ounces to 2
    Then On Order Details form, expect Ounces is 2
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, expect Pounds is 1
    Then On Order Details form, set Insure-For to $150
    Then On Order Details form, expect Insure-For Cost is greater than $1
    Then On Order Details form, expect Insure-For is $150
    Then On Order Details form, set Height to 2
    Then On Order Details form, set Length to 3
    Then On Order Details form, set Width to 4

    Then Sign out
