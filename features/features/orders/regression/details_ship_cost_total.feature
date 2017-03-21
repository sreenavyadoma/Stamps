
Feature: Details Ship Cost Total
  1. B-01631 As a batch shipper, I want is able to see the total cost of my print job before I print
  2. Update Total Cost at Bottom of Details Panel

  Background:
    Given a valid user is signed in to Web Apps

  @details_ship_cost_total
  Scenario: Ship Cost Total
    Then in Orders Toolbar, click Add button
    Then expect Order Details form Total label is Total Ship Cost:
    Then set Order Details form Ship-From to default
    Then expect Order Details form Service Cost is 0.00
    Then expect Order Details form Insure-For Cost is 0.00
    Then expect Order Details form Tracking Cost is 0.00
    Then expect Order Details form Total Ship Cost is 0.00

    Then set Order Details form Ship-To to random address in zone 8
    Then on Order Details form, select service PM Package
    Then set Order Details form Ounces to 1
    Then set Order Details form Pounds to 1
    Then set Order Details form Tracking to Signature Required
    Then set Order Details form Length to 1
    Then set Order Details form Width to 1
    Then set Order Details form Height to 1

    Then expect Order Details form Service Cost is greater than $1.00
    Then expect Order Details form Tracking Cost is greater than $1.00
    Then expect Order Details form Ship Cost Total is correct

    Then Sign out

