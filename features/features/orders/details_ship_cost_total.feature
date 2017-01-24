
Feature: Details Ship Cost Total
  1. B-01631 As a batch shipper, I want is able to see the total cost of my print job before I print
  2. Update Total Cost at Bottom of Details Panel

  Background:
    Given A user is signed in to Orders

  @details_ship_cost_total
  Scenario: Ship Cost Total
    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Total label is Total Ship Cost:
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, expect service Cost is $0.00
    Then On Order Details form, expect Insure-For Cost is $0.00
    Then On Order Details form, expect Tracking Cost is $0.00
    Then On Order Details form, expect Total Ship Cost is $0.00

    Then On Order Details form, set Ship-To to address in Zone 8
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Insure-For to $58.00
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, set Tracking to Signature Required
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1

    Then On Order Details form, expect service Cost is greater than $1.00
    #Then On Order Details form, expect Insure-For Cost is greater than $1.00
    Then On Order Details form, expect Tracking Cost is greater than $1.00
    Then On Order Details form, expect Ship Cost Total is correct

    Then Sign out

