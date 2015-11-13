
Feature:  BVT Printing

  Background:
    Given I am signed in as a batch shipper

  @bvt_printing
  Scenario:  Printing
    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Height to 1
    Then Set Order Form Width to 1
    Then Set Order Form Length to 1
    Then Print
    And Sign out
