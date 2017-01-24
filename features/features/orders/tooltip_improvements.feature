
Feature: Tooltips Improvements

  Background:
    Given A user is signed in to Orders

  @tooltips_improvements
  Scenario: Tooltips Improvements
    Then Filter Panel: Menu Item collapse button tooltip should be Collapse this panel.
    Then Filter Panel: Collapse Panel
    Then Filter Panel: Menu Item expand button tooltip should be Expand this panel.
    Then Filter Panel: Expand Panel
    Then In Orders Toolbar, expect Add Tooltip to include Add
    Then In Orders Toolbar, expect Add Tooltip to include Create a new, blank order.
    Then In Orders Toolbar, click Add button
    Then In Orders Toolbar, expect Move Tooltip to include Move
    Then In Orders Toolbar, expect Move Tooltip to include Move all selected orders to a different status.
    Then In Orders Toolbar, expect Print Tooltip to include Print
    Then In Orders Toolbar, expect Print Tooltip to include Print labels for all selected orders.
    Then On Order Details form, Collapse Panel
    Then On Order Details form, Expand panel
    Then On Order Details form, expect Toolbar Menu Tooltip is View more options

