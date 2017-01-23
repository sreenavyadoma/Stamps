
Feature: Order Status - Awaiting Shipment

  Background:
    Given I am signed in to Orders

  @grid_order_status
  Scenario: Order Status
    Then Orders Toolbar: Add
    Then Orders Grid: Expect Order Status is Awaiting Shipment
    Then Sign out