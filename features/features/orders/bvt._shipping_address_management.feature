
Feature:  BVT Address Management

  Background:
    Given I am signed in to Orders

  @bvt_shipping_address_management
  Scenario: Add and Delete Ship-From Address
    And I Add a new order
    And Add Ship-From address random
    Then Expect random Ship-From address was added
    And Delete random Ship-From address
    And Delete all Ship-From address
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Height to 1
    Then Set Order Details Width to 1
    Then Set Order Details Length to 1

    And Sign out
