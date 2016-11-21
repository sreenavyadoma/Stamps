
Feature: Add Canceled Filter Panel - and Allow User to Manually Change Order Status

  Background:
    Given I am signed in to Orders

  @filter_change_order_status
  Scenario: Add Canceled Filter Panel - and Allow User to Manually Change Order Status
    Then Left Panel: Select Shipped
    Then Pause for 3 seconds
    Then Left Panel: Select Cancelled
    Then Pause for 3 seconds
    Then Left Panel: Select Awaiting Shipment
    Then Pause for 3 seconds

    Then Toolbar: Add
    Then Pause for 1 second

    Then Toolbar: Move to Shipped
    Then Pause for 3 seconds
    Then Left Panel: Select Shipped
    Then Pause for 3 seconds
    Then Left Panel: Expect order moved to Shipped

    Then Pause for 3 seconds
    Then Toolbar: Move to Canceled
    Then Pause for 3 seconds
    Then Left Panel: Select Cancelled
    Then Pause for 3 seconds
    Then Left Panel: Expect order moved to Canceled

    Then Pause for 3 seconds
    Then Left Panel: Select Cancelled
    Then Pause for 3 seconds
    Then Left Panel: Move order to Awaiting Shipment
    Then Pause for 3 seconds
    Then Left Panel: Select Awaiting Shipment
    Then Pause for 3 seconds
    Then Left Panel: Expect order moved to Awaiting Shipment

    Then Sign out
