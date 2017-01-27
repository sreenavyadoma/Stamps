
Feature: Saved Order ID Created

  Background:
    Given a valid user is signed in to Web Apps

  @order_id
  Scenario:  Saved Order ID Created
    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, expect Order ID equals Grid Oder ID in row 1
    Then Sign out
