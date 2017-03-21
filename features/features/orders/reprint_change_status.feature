
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given a valid user is signed in to Web Apps

  @reprint_change_status @reprint
  Scenario: Allow User to Manually Change Order Status - User Reprints Order
    Then In left Filter Panel, select Shipped
    Then In left Filter Panel, select Awaiting Shipment

    Then click Orders Toolbar Add button

    Then In Orders Grid toolbar, select Move to Shipped
    Then In left Filter Panel, select Shipped
    Then In left Filter Panel, expect order moved to Shipped

    Then In left Filter Panel, select Shipped
    Then check Orders Grid saved Order ID
    Then in Print modal, Open Reprint Modal
    Then Label Unavailable:  Expect Visible
    Then Pause for 5 seconds

    Then Sign out
