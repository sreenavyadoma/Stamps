
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @reprint_change_status @reprint
  Scenario: Allow User to Manually Change Order Status - User Reprints Order
    Then Filter Panel: Select Shipped
    Then Filter Panel: Select Awaiting Shipment

    Then Orders Toolbar: Add

    Then Orders Grid Toolbar: Move to Shipped
    Then Filter Panel: Select Shipped
    Then Filter Panel: Expect order moved to Shipped

    Then Filter Panel: Select Shipped
    Then Orders Grid: Check saved Order ID
    Then Print Modal: Open Reprint Modal
    Then Label Unavailable:  Expect Visible
    Then Pause for 5 seconds

    Then Sign out
