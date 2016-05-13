
Feature: Order Status - Awaiting Shipment

  Background:
    Given I am signed in to Orders

  @grid_order_status
  Scenario: Order Status
    Then Toolbar: Add
    Then Grid: Expect Order Status to be Awaiting Shipment
    Then Sign out