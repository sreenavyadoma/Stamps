Feature:  BVT Order Creation

  Background:
    Given I am signed in to Orders

  @bvt_new_order
  Scenario:  Add a new order
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1

    Then Details: Set Ship-To to address in Zone 5 through 8

    Then Details: Select Service Priority Mail Package

    # Single Order Details Weight
    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1

    # Single Order Details Insure For value
    Then Details: Set Insure-For to $1.00

    # Single Order Details Dimensions
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1

    # Orders Grid Operations
    Then Grid: Uncheck row 1
    Then Grid: Expect Pounds is 1
    Then Grid: Expect Ounces is 1
    Then Grid: Expect Weight is 1 lbs. 1 oz.
    Then Grid: Expect Insured Value is $1.00
    Then Sign out