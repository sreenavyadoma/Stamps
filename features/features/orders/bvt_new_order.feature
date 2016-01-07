@bvt
Feature:  BVT Order Creation

  Background:
    Given I am signed in to Orders

  @bvt_add_new_order
  Scenario:  Add a new order
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 5 through 8
    Then Increment Order Details Pounds by 7
    Then Decrement Order Details Pounds by 6
    Then Increment Order Details Ounces by 7
    Then Decrement Order Details Ounces by 6


    Then Increment Order Details Length by 7
    Then Decrement Order Details Length by 6

    Then Increment Order Details Width by 7
    Then Decrement Order Details Width by 6

    Then Increment Order Details Height by 7
    Then Decrement Order Details Height by 6

    Then Increment Order Details Insure For by 7
    Then Decrement Order Details Insure For by 6

    Then Set Order Details Pounds to 10
    Then Set Order Details Ounces to 10
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Length to 10
    Then Set Order Details Width to 10
    Then Set Order Details Height to 10
    Then Set Order Details Insure For to $1.00
    Then Expect Grid Pounds to be 1
    Then Expect Grid Ounces to be 1
    Then Expect Grid Weight to be 1 lbs. 1 oz.
    Then Expect Grid Insured Value to be $1.00
    And Sign out

