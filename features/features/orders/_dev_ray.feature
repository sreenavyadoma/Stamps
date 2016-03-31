
Feature: As a batch shipper, I want to be able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @change_order_status_reprint
  Scenario: Allow User to Manually Change Order Status - User Reprints Order
    Then Filter: Select Shipped
    Then Filter: Select Awaiting Shipment

    Then Add New Order

    Then Toolbar: Move to Shipped
    Then Filter: Select Shipped
    Then Expect order moved to Shipped

    Then Filter: Select Shipped
    Then Grid: Set New Order ID to check
    Then Open Reprint Modal
    Then Label Unavailable:  Expect Visible
    Then Pause for 5 seconds

    Then Sign out
