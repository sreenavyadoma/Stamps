Feature: Item Details

  Background:
    Given I am signed in to Orders

  @item_details
  Scenario:  Item Details
    Then Pause for 3 seconds
    Then Grid: Check row 10

    Then Pause for 3 seconds

    Then Details: Expand Store Items Ordered pane
    Then Details: Collapse Store Items Ordered pane
    Then Details: Expand Store Items Ordered pane
    Then Details: Collapse Store Items Ordered pane

    Then Grid: Uncheck row 10
    Then Pause for 3 seconds
    Then Grid: Check row 4
    Then Pause for 3 seconds

    Then Details: Expand Store Items Ordered pane
    Then Details: Add Item 1, Qty 1, ID random, Description random
    Then Details: Add Item 2, Qty 1, ID random, Description random
    Then Details: Add Item 3, Qty 1, ID random, Description random
    Then Details: Add Item 4, Qty 1, ID random, Description random


    Then Details: Collapse Manual Items Ordered pane
    Then Details: Expand Manual Items Ordered pane
    Then Details: Delete Item 4
    Then Details: Delete Item 3
    Then Details: Delete Item 2
    Then Details: Delete Item 1
    Then Details: Collapse Manual Items Ordered pane


    Then Sign out
