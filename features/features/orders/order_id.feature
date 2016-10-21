
Feature: Saved Order ID Created

  Background:
    Given I am signed in to Orders

  @order_id
  Scenario:  Saved Order ID Created
    Then Toolbar: Add
    Then Details: Expect Order ID is truthy
    Then Details: Expect Order ID equals Grid order ID
    Then Sign out
