Feature: Item Details

  Background:
    Given I am signed in to Orders

  @item_details
  Scenario:  Item Details
    Then Pause for 3 seconds
    Then Orders Grid: Check row 10

    Then Pause for 3 seconds

    Then Order Details: Expand Store Items Ordered pane
    Then Order Details: Collapse Store Items Ordered pane
    Then Order Details: Expand Store Items Ordered pane
    Then Order Details: Collapse Store Items Ordered pane

    Then Orders Grid: Uncheck row 10
    Then Pause for 3 seconds
    Then Orders Grid: Check row 4
    Then Pause for 3 seconds

    Then Order Details: Expand Store Items Ordered pane
    Then Order Details: Add Item 1, Qty 1, ID random, Description random
    Then Order Details: Add Item 2, Qty 1, ID random, Description random
    Then Order Details: Add Item 3, Qty 1, ID random, Description random
    Then Order Details: Add Item 4, Qty 1, ID random, Description random


    Then Order Details: Collapse Manual Items Ordered pane
    Then Order Details: Expand Manual Items Ordered pane
    Then Order Details: Delete Item 4
    Then Order Details: Delete Item 3
    Then Order Details: Delete Item 2
    Then Order Details: Delete Item 1
    Then Order Details: Collapse Manual Items Ordered pane


    Then Sign out
