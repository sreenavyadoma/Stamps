
Feature: New Order ID Created

  Background:
    Given I am signed in to Orders

  @order_id
  Scenario:  New Order ID Created
    Then Add New Order
    Then Expect new Order ID created
    Then Order Details: Expect Order ID equals Grid order ID
    And Sign out
