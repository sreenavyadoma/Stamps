@bvt
Feature:  BVT Printing

  Background:
    Given I am signed in to Orders

  @bvt_printing
  Scenario:  Printing
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Package"
    Then Set Order Details Form Ounces to 1
    Then Set Order Details Form Height to 1
    Then Set Order Details Form Width to 1
    Then Set Order Details Form Length to 1
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print
    And Sign out
