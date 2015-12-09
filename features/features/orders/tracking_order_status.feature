
Feature: Orders Grid - Tracking & Order Status

  Background:
    Given I am signed in to Orders

  @grid_tracking_order_status
  Scenario: Tracking & Order Status
    And I Add a new order
    Then Expect Order Status to be "Awaiting Shipment"
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    And Set Order Details Form Tracking to "USPS Tracking"
    Then Print
    Then Filter Shipped Orders
    Then Expect Grid Tracking Number is populated
    Then Expect Order Status to be "Shipped"

    And I Add a new order
    Then Expect Order Status to be "Awaiting Shipment"
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    And Set Order Details Form Tracking to "Signature Required"
    Then Print
    Then Filter Shipped Orders
    Then Expect Grid Tracking Number is populated
    Then Expect Order Status to be "Shipped"

    Then Sign out
