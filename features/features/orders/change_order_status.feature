
Feature: Add Canceled Filter Panel - and Allow User to Manually Change Order Status

  Background:
    Given I am signed in to Orders

  @change_order_status
  Scenario: Add Canceled Filter Panel - and Allow User to Manually Change Order Status
    Then Filter Panel - Shipped
    Then Filter Panel - Cancelled
    Then Filter Panel - Awaiting Shipment

    Then Add New Order

    Then Toolbar: Move to Shipped
    Then Filter Panel - Shipped
    Then Expect order moved to Shipped

    Then Toolbar: Move to Canceled
    Then Filter Panel - Cancelled
    Then Expect order moved to Canceled

    Then Move order to Awaiting Shipment
    Then Filter Panel - Awaiting Shipment
    Then Expect order moved to Awaiting Shipment

    Then Sign out
