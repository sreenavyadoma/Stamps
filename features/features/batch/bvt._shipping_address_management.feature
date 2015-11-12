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

    And Sign out
