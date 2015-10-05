
Feature:  BVT Printing

  Background:
    Given I am signed in as a batch shipper

  @bvt_printing
  Scenario:  Printing
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Package"
    Then Print
    And Sign out
