
Feature: Order Status - Awaiting Shipment

  Background:
    Given A user is signed in to Orders

  @grid_order_status
  Scenario: Order Status
    Then In Orders Toolbar, click Add button
    Then In Orders Grid, expect Order Status is Awaiting Shipment
    Then Sign out