
Feature: Add Canceled Filter Panel - and Allow User to Manually Change Order Status

  Background:
    Given I am signed in to Orders

  @change_order_status
  Scenario: Add Canceled Filter Panel - and Allow User to Manually Change Order Status
    Then Filter Panel - Shipped
    Then Pause for 1 seconds
    Then Filter Panel - Cancelled
    Then Pause for 1 seconds
    Then Filter Panel - Awaiting Shipment
    Then Pause for 1 seconds

    Then Add New Order
    Then Pause for 1 seconds

    Then Toolbar: Move to Shipped
    Then Pause for 1 seconds
    Then Filter Panel - Shipped
    Then Pause for 1 seconds
    Then Expect order moved to Shipped

    Then Pause for 1 seconds
    Then Toolbar: Move to Canceled
    Then Pause for 1 seconds
    Then Filter Panel - Cancelled
    Then Pause for 1 seconds
    Then Expect order moved to Canceled

    Then Pause for 1 seconds
    Then Filter Panel - Cancelled
    Then Pause for 1 seconds
    Then Move order to Awaiting Shipment
    Then Pause for 1 seconds
    Then Filter Panel - Awaiting Shipment
    Then Pause for 1 seconds
    Then Expect order moved to Awaiting Shipment

    Then Sign out
