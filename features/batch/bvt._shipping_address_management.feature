@bvt
Feature:  BVT - Shipping Address Management

  Background:
    * I am signed in as a batch shipper

  @bvt_shipping_address_management
  Scenario: Shipping Address Management
    * Add new order
    * Set Ship From to default
    * Add new random Ship-From address
    * Expect new Ship-From address was added
    * Sign out
