@bvt
Feature:  BVT Order Creation

  Background:
    Given I am signed in to Orders

  @bvt_add_new_order
  Scenario:  Add a new order
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Details: Set Service to "Priority Mail Package"

    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Insure-For to $1.00
    Then Grid: Expect Pounds to be 1
    Then Grid: Expect Ounces to be 1
    Then Grid: Expect Weight to be 1 lbs. 1 oz.
    Then Grid: Expect Insured Value to be $1.00
    Then Sign out

