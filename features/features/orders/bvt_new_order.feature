Feature:  BVT Order Creation

  Background:
    Given I am signed in to Orders

  @bvt_new_order
  Scenario:  Add a new order
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1

    Then Order Details: Set Ship-To to address in Zone 5 through 8

    Then Order Details: Select Service PM Package

    # Single Order Details Weight
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Ounces to 1

    # Single Order Details Insure For value
    Then Order Details: Set Insure-For to $1.00

    # Single Order Details Dimensions
    Then Order Details: Set Length to 1
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1

    # Orders Grid Operations
    Then Orders Grid: Uncheck row 1
    Then Orders Grid: Expect Pounds is 1
    Then Orders Grid: Expect Ounces is 1
    Then Orders Grid: Expect Weight is 1 lb. 1 oz.
    Then Orders Grid: Expect Insured Value is $1.00
    Then Sign out