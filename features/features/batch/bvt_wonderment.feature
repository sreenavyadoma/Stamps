
Feature:  BVT Wonderment

  Background:
    Given I am signed in as a batch shipper

  @wonderment_bvt
  Scenario:  Add a new order
    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    Then Set Order Form Pounds to 1
    Then Set Order Form Ounces to 1
    Then Set Order Form Length to 1
    Then Set Order Form Width to 1
    Then Set Order Form Height to 1
    Then Set Order Form Insured Value to $1.00
    Then Set Order Form Service to "Priority Mail Package"
    And Sign out