
Feature: As a batch shipper, I want to be able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @filter_change_order_status_reprint
  Scenario: Allow User to Manually Change Order Status - User Reprints Order
    Then Filter: Select Shipped
    Then Filter: Select Awaiting Shipment

    Then Toolbar: Add

    Then Toolbar: Move to Shipped
    Then Filter: Select Shipped
    Then Filter: Expect order moved to Shipped

    Then Filter: Select Shipped
    Then Grid: Check New Order ID
    Then Print: Open Reprint Modal
    Then Label Unavailable:  Expect Visible
    Then Pause for 5 seconds

    Then Sign out
