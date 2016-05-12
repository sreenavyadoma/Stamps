
Feature: Tooltips Improvements

  Background:
    Given I am signed in to Orders

  @tooltips_improvements
  Scenario: Tooltips Improvements
    Then Filter: Menu Item collapse button tooltip should be Collapse this panel.
    Then Filter: Collapse Panel
    Then Filter: Menu Item expand button tooltip should be Expand this panel.
    Then Filter: Expand Panel
    Then Toolbar: Expect Add Tooltip to include Add
    Then Toolbar: Expect Add Tooltip to include Create a new, blank order.
    Then Toolbar: Add
    Then Toolbar: Expect Move Tooltip to include Move
    Then Toolbar: Expect Move Tooltip to include Move all selected orders to a different status.
    Then Toolbar: Expect Print Tooltip to include Print
    Then Toolbar: Expect Print Tooltip to include Print labels for all selected orders.
    Then Details: Collapse Panel
    Then Details: Expand panel
    Then Details: Expect Toolbar Menu Tooltip to be View more options

