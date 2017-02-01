
Feature: Details Ship Cost Total
  1. B-01631 As a batch shipper, I want is able to see the total cost of my print job before I print
  2. Update Total Cost at Bottom of Details Panel

  Background:
    Given a valid user is signed in to Web Apps

  @details_ship_cost_total
  Scenario: Ship Cost Total
    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Total label is Total Ship Cost:
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, expect service Cost is $0.00
    Then on Order Details form, expect Insure-For Cost is $0.00
    Then on Order Details form, expect Tracking Cost is $0.00
    Then on Order Details form, expect Total Ship Cost is $0.00

    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, set Tracking to Signature Required
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1

    Then on Order Details form, expect service Cost is greater than $1.00
    Then on Order Details form, expect Tracking Cost is greater than $1.00
    Then on Order Details form, expect Ship Cost Total is correct

    Then Sign out

