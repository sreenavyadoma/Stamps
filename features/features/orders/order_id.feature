
Feature: Saved Order ID Created

  Background:
    Given I am signed in to Orders

  @order_id
  Scenario:  Saved Order ID Created
    Then Orders Toolbar: Add
    Then Order Details: Expect Order ID is truthy
    Then Order Details: Expect Order ID equals Grid Oder ID in row 1
    Then Sign out
