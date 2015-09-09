@bvt
Feature:  BVT Address Management

  Background:
    Given I am signed in as a batch shipper

  @bvt_shipping_address_management
  Scenario: Shipping Address Management
    And I Add a new order
    And Add new random Ship-From address
    Then Expect random Ship-From address was added
    And Delete random Ship-From address
    And Delete all Ship-From address
    And Sign out
