@bugs_orders_filter_panel
Feature: Filter Panel Bugs

  Background:
    Given a valid user is signed in to Web Apps

  @bugs_orders_deselect_fails
  Scenario:  ORDERSAUTO-3497 Legacy sprint - WEBAPPS-7073 Clicking Status Filter Fails to Deselect Orders
    Then add new order
    Then expect Order Details Form is present
    Then uncheck order
    Then expect Order Details Form is not present
    Then check order
    Then expect Order Details Form is present
    Then select Filter Panel tab Awaiting Shipment
    Then expect Order Details Form is not present