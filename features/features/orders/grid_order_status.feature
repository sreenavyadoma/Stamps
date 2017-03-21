
Feature: Order Status - Awaiting Shipment

  Background:
    Given a valid user is signed in to Web Apps

  @grid_order_status
  Scenario: Order Status
    Then click Orders Toolbar Add button
    Then expect Orders Grid Order Status is Awaiting Shipment
    Then Sign out