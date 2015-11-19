
Feature:  BVT Order Creation

  Background:
    Given I am signed in as a batch shipper

  @bvt_add_new_order
  Scenario:  Add a new order
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Pounds to 1
    Then Set Order Details Form Ounces to 1
    Then Set Order Details Form Length to 1
    Then Set Order Details Form Width to 1
    Then Set Order Details Form Height to 1
    Then Set Order Details Form Insured Value to $1.00
    Then Set Order Details Form Service to "Priority Mail Package"
    Then Expect Grid Pounds to be 1
    Then Expect Grid Ounces to be 1
    Then Expect Grid Weight to be 1 lbs. 1 oz.
    Then Expect Grid Insured Value to be $1.00
    And Sign out
