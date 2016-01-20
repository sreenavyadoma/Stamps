
Feature:  BVT Address Management

  Background:
    Given I am signed in to Orders

  @bvt_shipping_address_management
  Scenario: Add and Delete Ship-From Address
    When Add New Order
    And Add Ship-From address random
    Then Expect random Ship-From address was added
    And Delete random Ship-From address
    And Delete all Ship-From address
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Priority Mail Package"
    And Sign out
