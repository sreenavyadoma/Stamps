
Feature:  BVT Wonderment

  Background:
    Given I am signed in to Orders

  @wonderment_bvt
  Scenario:  Add a new order
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 5 through 8
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Pounds to 1
    Then Set Order Details Ounces to 1
    Then Set Order Details Length to 1
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Insured Value to $1.00
    And Sign out