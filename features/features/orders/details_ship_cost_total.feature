
Feature: Details Ship Cost Total
  1. B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print
  2. Update Total Cost at Bottom of Details Panel

  Background:
    Given I am signed in to Orders

  @details_ship_cost_total
  Scenario: Ship Cost Total
    Then Toolbar: Add
    Then Details: Expect Total label to be Total Ship Cost:
    Then Details: Set Ship-From to default
    Then Details: Expect Service Cost to be $0.00
    Then Details: Expect Insure-For Cost to be $0.00
    Then Details: Expect Tracking Cost to be $0.00
    Then Details: Expect Total to be $0.00

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Select Service Priority Mail Package
    Then Details: Set Insure-For to $58.00
    Then Details: Set Ounces to 1
    Then Details: Set Pounds to 1
    Then Details: Set Tracking to Signature Required
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1

    Then Details: Expect Service Cost to be greater than $1.00
    #Then Details: Expect Insure-For Cost to be greater than $1.00
    Then Details: Expect Tracking Cost to be greater than $1.00
    Then Details: Expect Ship Cost Total is correct

    Then Sign out

