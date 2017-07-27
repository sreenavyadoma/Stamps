
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given a valid user is signed in to Web Apps

  @reprint_change_status @reprint
  Scenario: Allow User to Manually Change Order Status - User Reprints Order
    Then click Filter Panel Shipped tab
    Then click Filter Panel Awaiting Shipment tab

    Then add new order

    Then In Orders Grid toolbar, select Move to Shipped
    Then click Filter Panel Shipped tab
    Then In left Filter Panel, expect order moved to Shipped

    Then click Filter Panel Shipped tab
    Then check Orders Grid saved Order ID
    Then in Print modal, Open Reprint Modal
    Then Label Unavailable:  Expect Visible
    Then Pause for 5 seconds

    Then Sign out
