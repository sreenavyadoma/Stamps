Feature: Item Details

  Background:
    Given a valid user is signed in to Web Apps

  @item_details
  Scenario:  Item Details
    Then pause for 3 seconds
    Then check Orders Grid row 10

    Then pause for 3 seconds

    Then on Order Details form, Expand Store Items Ordered pane
    Then on Order Details form, Collapse Store Items Ordered pane
    Then on Order Details form, Expand Store Items Ordered pane
    Then on Order Details form, Collapse Store Items Ordered pane

    Then uncheck Orders Grid row 10
    Then pause for 3 seconds
    Then check Orders Grid row 4
    Then pause for 3 seconds

    Then on Order Details form, Expand Store Items Ordered pane
    Then on order details form, add item 1, qty 1, id random, description random
    Then on order details form, add item 2, qty 1, id random, description random
    Then on order details form, add item 3, qty 1, id random, description random
    Then on order details form, add item 4, qty 1, id random, description random


    Then on Order Details form, Collapse Manual Items Ordered pane
    Then on Order Details form, Expand Manual Items Ordered pane
    Then on Order Details form, Delete Item 4
    Then on Order Details form, Delete Item 3
    Then on Order Details form, Delete Item 2
    Then on Order Details form, Delete Item 1
    Then on Order Details form, Collapse Manual Items Ordered pane


    Then sign out
