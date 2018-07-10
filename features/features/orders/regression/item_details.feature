Feature: Item Details

  Background:
    Given a valid user is signed in to Web Apps

  @item_details
  Scenario:  Item Details
    Then pause for 3 seconds
    Then check row 10

    Then pause for 3 seconds

    Then on Order Details form, Expand Store Items Ordered pane
    Then on Order Details form, Collapse Store Items Ordered pane
    Then on Order Details form, Expand Store Items Ordered pane
    Then on Order Details form, Collapse Store Items Ordered pane

    Then uncheck row 10
    Then pause for 3 seconds
    Then check row 4
    Then pause for 3 seconds

    Then on Order Details form, Expand Store Items Ordered pane
    Then add order details item 1, qty 1, id random, description random
    Then add order details item 2, qty 1, id random, description random
    Then add order details item 3, qty 1, id random, description random
    Then add order details item 4, qty 1, id random, description random


    Then on Order Details form, Collapse Manual Items Ordered pane
    Then on Order Details form, Expand Manual Items Ordered pane
    Then on Order Details form, Delete Item 4
    Then on Order Details form, Delete Item 3
    Then on Order Details form, Delete Item 2
    Then on Order Details form, Delete Item 1
    Then on Order Details form, Collapse Manual Items Ordered pane


    Then sign out
