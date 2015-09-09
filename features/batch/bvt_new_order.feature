@bvt
Feature:  BVT Order Creation

  Background:
    Given I am signed in as a batch shipper

  @bvt_add_new_order
  Scenario:  I Add a new order
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Pounds to 1
    Then Set Ounces to 1
    Then Set Length to 1
    Then Set Width to 1
    Then Set Height to 1
    Then Set Insured Value to $1.00
    Then Set Service to Priority Mail Package
    Then Expect Order Grid - Pounds to be 1
    Then Expect Order Grid - Ounces to be 1
    Then Expect Order Grid - Weight to be 1 lbs. 1 oz.
    Then Expect Order Grid - Insured Value to be $1.00
    And Sign out
