@bvt
Feature:  BVT - Shipping Address Management

  Background:
    * I am signed in as a batch shipper

  @bvt_shipping_address_management
  Scenario: Shipping Address Management
    * Add new order
    * Add new random Ship-From address
    * Expect random Ship-From address was added
    * Delete random Ship-From address
    * Delete Ship-From Row 1 from Manage Shipping Addresses Modal
    * Delete all Ship-From address
    * Sign out
