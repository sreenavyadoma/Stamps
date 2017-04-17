
Feature: Order Status - Awaiting Shipment

  Background:
    Given a valid user is signed in to Web Apps

  @grid_order_status
  Scenario: Order Status
    Then add new order
    Then expect Orders Grid Order Status is Awaiting Shipment
    Then Sign out