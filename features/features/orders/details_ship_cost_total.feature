
Feature: Details Ship Cost Total
  1. B-01631 As a batch shipper, I want is able to see the total cost of my print job before I print
  2. Update Total Cost at Bottom of Details Panel

  Background:
    Given I am signed in to Orders

  @details_ship_cost_total
  Scenario: Ship Cost Total
    Then Orders Toolbar: Add
    Then Order Details: Expect Total label is Total Ship Cost:
    Then Order Details: Set Ship-From to default
    Then Order Details: Expect Service Cost is $0.00
    Then Order Details: Expect Insure-For Cost is $0.00
    Then Order Details: Expect Tracking Cost is $0.00
    Then Order Details: Expect Total Ship Cost is $0.00

    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PM Package
    Then Order Details: Set Insure-For to $58.00
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Tracking to Signature Required
    Then Order Details: Set Length to 1
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1

    Then Order Details: Expect Service Cost is greater than $1.00
    #Then Order Details: Expect Insure-For Cost is greater than $1.00
    Then Order Details: Expect Tracking Cost is greater than $1.00
    Then Order Details: Expect Ship Cost Total is correct

    Then Sign out

