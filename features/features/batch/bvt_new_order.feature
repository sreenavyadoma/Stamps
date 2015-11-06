@bvt
Feature:  BVT Order Creation

  Background:
    Given I am signed in as a batch shipper

  @bvt_add_new_order
  Scenario:  Add a new order
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Pounds to 1
    Then Set single-order form Ounces to 1
    Then Set single-order form Length to 1
    Then Set single-order form Width to 1
    Then Set single-order form Height to 1
    Then Set single-order form Insured Value to $1.00
    Then Set single-order form Service to "Priority Mail Package"
    Then Expect Grid Pounds to be 1
    Then Expect Grid Ounces to be 1
    Then Expect Grid Weight to be 1 lbs. 1 oz.
    Then Expect Grid Insured Value to be $1.00
    And Sign out
