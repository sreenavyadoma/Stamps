
Feature: Orders Grid - Tracking & Order Status

  Background:
    Given I am signed in to Orders

  @grid_tracking_order_status
  Scenario: Tracking & Order Status
    When Add New Order
    Then Expect Order Status to be "Awaiting Shipment"
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Ounces to 5
    Then Order Details - Set Service to "Priority Mail Flat Rate Envelope"
    And Order Details - Set Tracking to "USPS Tracking"
    Then Print
    Then Filter Shipped
    Then Expect Grid Tracking Number is populated
    Then Expect Order Status to be "Shipped"

    When Add New Order
    Then Expect Order Status to be "Awaiting Shipment"
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Ounces to 5
    Then Order Details - Set Service to "Priority Mail Flat Rate Envelope"
    And Order Details - Set Tracking to "Signature Required"
    Then Print
    Then Filter Shipped
    Then Expect Grid Tracking Number is populated
    Then Expect Order Status to be "Shipped"

    Then Sign out
