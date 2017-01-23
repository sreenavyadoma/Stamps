
Feature: Tooltips Improvements

  Background:
    Given I am signed in to Orders

  @tooltips_improvements
  Scenario: Tooltips Improvements
    Then Filter Panel: Menu Item collapse button tooltip should be Collapse this panel.
    Then Filter Panel: Collapse Panel
    Then Filter Panel: Menu Item expand button tooltip should be Expand this panel.
    Then Filter Panel: Expand Panel
    Then Orders Toolbar: Expect Add Tooltip to include Add
    Then Orders Toolbar: Expect Add Tooltip to include Create a new, blank order.
    Then Orders Toolbar: Add
    Then Orders Toolbar: Expect Move Tooltip to include Move
    Then Orders Toolbar: Expect Move Tooltip to include Move all selected orders to a different status.
    Then Orders Toolbar: Expect Print Tooltip to include Print
    Then Orders Toolbar: Expect Print Tooltip to include Print labels for all selected orders.
    Then Order Details: Collapse Panel
    Then Order Details: Expand panel
    Then Order Details: Expect Toolbar Menu Tooltip is View more options

