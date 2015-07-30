@regression
Feature: Order Status - Awaiting Shipment

  Background:
    Given I am signed in as a batch shipper

  @order_status
  Scenario: Order Status - Awaiting Shipment
    * Add new order
    * Expect Order Status to be Awaiting Shipment
    * Sign out
