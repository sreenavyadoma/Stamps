
Feature:  BVT Wonderment

  Background:
    Given I am signed in as a batch shipper

  @wonderment_bvt
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
    Then Expect order-grid Pounds to be 1
    Then Expect order-grid Ounces to be 1
    Then Expect order-grid Weight to be 1 lbs. 1 oz.
    Then Expect order-grid Insured Value to be $1.00
    And Sign out