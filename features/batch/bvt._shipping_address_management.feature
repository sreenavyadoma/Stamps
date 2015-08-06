@bvt
Feature:  BVT - Shipping Address Management

  Background:
    * I am signed in as a batch shipper

  @bvt_shipping_address_management
  Scenario: Shipping Address Management
    * Add new order
    * Add new Ship-From address random
    * Expect random Ship-From address was added
    * Sign out
