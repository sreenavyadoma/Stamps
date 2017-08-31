
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given a valid user is signed in to Web Apps

  @reprint_change_status @reprint
  Scenario: Allow User to Manually Change Order Status - User Reprints Order
    Then select Filter Panel tab Shipped
    Then select Filter Panel tab Awaiting Shipment

    Then add new order

    Then select Grid Toolbar Move menu item Move to Shipped
    Then select Filter Panel tab Shipped
    Then In left Filter Panel, expect order moved to Shipped

    Then select Filter Panel tab Shipped
    Then check Orders Grid for cached Order ID
    Then in Print modal, Open Reprint Modal
    Then Label Unavailable:  Expect Visible
    Then Pause for 5 seconds

    Then Sign out
