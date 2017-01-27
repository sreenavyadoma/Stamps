Feature: Edit Order Details

  Background:
    Given a valid user is signed in to Web Apps

  @details_edit_order
  Scenario: User edits an order

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Ounces to 3
    Then on Order Details form, set Pounds to 2
    Then on Order Details form, set Insure-For to $100.00
    Then on Order Details form, expect Insure-For Cost is greater than $1
    Then on Order Details form, expect Insure-For is $100
    Then on Order Details form, set Height to 1
    Then on Order Details form, expect Height is 1
    Then on Order Details form, set Length to 1
    Then on Order Details form, expect Length is 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, expect Width is 1

    Then on Order Details form, select service PM Package
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, expect Ounces is 2
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, expect Pounds is 1
    Then on Order Details form, set Insure-For to $150
    Then on Order Details form, expect Insure-For Cost is greater than $1
    Then on Order Details form, expect Insure-For is $150
    Then on Order Details form, set Height to 2
    Then on Order Details form, set Length to 3
    Then on Order Details form, set Width to 4

    Then Sign out
