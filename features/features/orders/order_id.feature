
Feature: New Order ID Created

  Background:
    Given I am signed in to Orders

  @order_id
  Scenario:  New Order ID Created
    When Add New Order
    Then Expect new Order ID created
    Then Expect Order Details Order ID equals Grid order ID
    And Sign out
