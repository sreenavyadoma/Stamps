Feature:  BVT Order Creation

  Background:
    Given A user is signed in to Orders

  @bvt_new_order
  Scenario:  Add a new order
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1

    Then On Order Details form, set Ship-To to address in Zone 5 through 8

    Then On Order Details form, select service PM Package

    # Single Order Details Weight
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, set Ounces to 1

    # Single Order Details Insure For value
    Then On Order Details form, set Insure-For to $1.00

    # Single Order Details Dimensions
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1

    # Orders Grid Operations
    Then In Orders Grid, uncheck row 1
    Then In Orders Grid, expect Pounds is 1
    Then In Orders Grid, expect Ounces is 1
    Then In Orders Grid, expect Weight is 1 lb. 1 oz.
    Then In Orders Grid, expect Insured Value is $1.00
    Then Sign out