
Feature: Service Tooltip

  Background:
    Given I am signed in to Orders

  @tooltips_improvements
  Scenario: International Service Tooltip Tests
    Then Filter: Menu Item collapse button tooltip should be Collapse this panel.
    Then Filter: Collapse Panel
    Then Filter: Menu Item expand button tooltip should be Expand this panel.
    Then Filter: Expand Panel
    Then Toolbar: Expect Add Button Tooltip to include Add
    Then Toolbar: Expect Add Button Tooltip to include Create a new, blank order.
    Then Toolbar: Add
    Then Details: Collapse Panel
    Then Details: Expand panel
    Then Details: Expect Toolbar Menu Tooltip to be View more options
