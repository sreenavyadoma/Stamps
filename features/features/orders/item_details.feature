Feature: Item Details

  Background:
    Given a valid user is signed in to Web Apps

  @item_details
  Scenario:  Item Details
    Then Pause for 3 seconds
    Then In Orders Grid, check row 10

    Then Pause for 3 seconds

    Then On Order Details form, Expand Store Items Ordered pane
    Then On Order Details form, Collapse Store Items Ordered pane
    Then On Order Details form, Expand Store Items Ordered pane
    Then On Order Details form, Collapse Store Items Ordered pane

    Then In Orders Grid, uncheck row 10
    Then Pause for 3 seconds
    Then In Orders Grid, check row 4
    Then Pause for 3 seconds

    Then On Order Details form, Expand Store Items Ordered pane
    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then On Order Details form, Add Item 2, Qty 1, ID random, Description random
    Then On Order Details form, Add Item 3, Qty 1, ID random, Description random
    Then On Order Details form, Add Item 4, Qty 1, ID random, Description random


    Then On Order Details form, Collapse Manual Items Ordered pane
    Then On Order Details form, Expand Manual Items Ordered pane
    Then On Order Details form, Delete Item 4
    Then On Order Details form, Delete Item 3
    Then On Order Details form, Delete Item 2
    Then On Order Details form, Delete Item 1
    Then On Order Details form, Collapse Manual Items Ordered pane


    Then Sign out
