@bvt
Feature:  BVT Order Creation

  Background:
    Given I am signed in to Orders

  @bvt_add_new_order
  Scenario:  Add a new order
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details - Set Service to "Priority Mail Package"

    Then Order Details - Set Pounds to 1
    Then Order Details - Set Ounces to 1
    Then Order Details - Set Length to 1
    Then Order Details - Set Width to 1
    Then Order Details - Set Height to 1
    Then Order Details - Set Insure For to $1.00
    Then Expect Grid Pounds to be 1
    Then Expect Grid Ounces to be 1
    Then Expect Grid Weight to be 1 lbs. 1 oz.
    Then Expect Grid Insured Value to be $1.00
    And Sign out

