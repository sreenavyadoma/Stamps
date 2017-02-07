
Feature: Order Status - Awaiting Shipment

  Background:
    Given a valid user is signed in to Web Apps

  @grid_order_status
  Scenario: Order Status
    Then in Orders Toolbar, click Add button
    Then in Orders Grid, expect Order Status is Awaiting Shipment
    Then Sign out