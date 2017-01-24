
Feature: Saved Order ID Created

  Background:
    Given A user is signed in to Orders

  @order_id
  Scenario:  Saved Order ID Created
    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, expect Order ID equals Grid Oder ID in row 1
    Then Sign out
