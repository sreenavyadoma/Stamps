@bvt
Feature:  BVT Printing

  Background:
    Given I am signed in to Orders

  @bvt_printing
  Scenario:  Printing
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 1
    Then Set Order Details Height to 1
    Then Set Order Details Width to 1
    Then Set Order Details Length to 1
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Print
    And Sign out
