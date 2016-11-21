
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @reprint_change_status @reprint
  Scenario: Allow User to Manually Change Order Status - User Reprints Order
    Then Left Panel: Select Shipped
    Then Left Panel: Select Awaiting Shipment

    Then Toolbar: Add

    Then Toolbar: Move to Shipped
    Then Left Panel: Select Shipped
    Then Left Panel: Expect order moved to Shipped

    Then Left Panel: Select Shipped
    Then Grid: Check Saved Order ID
    Then Print: Open Reprint Modal
    Then Label Unavailable:  Expect Visible
    Then Pause for 5 seconds

    Then Sign out
