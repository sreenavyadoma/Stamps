
Feature: Tooltips Improvements

  Background:
    Given a valid user is signed in to Web Apps

  @tooltips_improvements
  Scenario: Tooltips Improvements
    Then Filter Panel: Menu Item collapse button tooltip should be Collapse this panel.
    Then Filter Panel: Collapse Panel
    Then Filter Panel: Menu Item expand button tooltip should be Expand this panel.
    Then Filter Panel: Expand Panel
    Then in Orders Toolbar, expect Add Tooltip to include Add
    Then in Orders Toolbar, expect Add Tooltip to include Create a new, blank order.
    Then add new order
    Then in Orders Toolbar, expect Move Tooltip to include Move
    Then in Orders Toolbar, expect Move Tooltip to include Move all selected orders to a different status.
    Then in Orders Toolbar, expect Print Tooltip to include Print
    Then in Orders Toolbar, expect Print Tooltip to include Print labels for all selected orders.
    Then on Order Details form, Collapse Panel
    Then on Order Details form, Expand panel
    Then expect Order Details form Toolbar Menu Tooltip is View more options

