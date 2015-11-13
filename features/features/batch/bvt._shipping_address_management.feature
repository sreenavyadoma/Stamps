@bvt
Feature:  BVT Address Management

  Background:
    Given I am signed in as a batch shipper

  @bvt_shipping_address_management
  Scenario: Add and Delete Ship-From Address
    And I Add a new order
    And Add Ship-From address random
    Then Expect random Ship-From address was added
    And Delete random Ship-From address
    And Delete all Ship-From address
    Then Set Order Form Ship-To address to random
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Height to 1
    Then Set Order Form Width to 1
    Then Set Order Form Length to 1

    And Sign out
