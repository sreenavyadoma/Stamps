
Feature:  BVT Address Management

  Background:
    Given I am signed in to Orders

  @bvt_shipping_address_management
  Scenario: Add and Delete Ship-From Address
    Then Add New Order
    Then Add Ship-From address random
    Then Expect random Ship-From address was added
    Then Delete random Ship-From address
    Then Delete all Ship-From address
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Priority Mail Package"
    Then Sign out
