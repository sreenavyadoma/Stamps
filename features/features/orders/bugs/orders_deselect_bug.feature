
Feature: WEBAPPS-7073  Clicking Status Filter Fails to Deselect Orders

  Background:
    Given a valid user is signed in to Web Apps

  @orders_deselect_fails
  Scenario:  Clicking Status Filter Fails to Deselect Orders
    Then add new order
    Then expect Order Details Form is present
    Then uncheck orders grid cached order id 1
    Then expect Order Details Form is not present
    Then check orders grid cached order id 1
    Then expect Order Details Form is present
    Then select Filter Panel tab Awaiting Shipment
    Then expect Order Details Form is not present