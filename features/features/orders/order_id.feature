
Feature: New Order ID Created

  Background:
    Given I am signed in to Orders

  @order_id
  Scenario:  New Order ID Created
    Then Toolbar: Add
    Then Expect new Order ID created
    Then Details: Expect Order ID equals Grid order ID
    Then Sign out
