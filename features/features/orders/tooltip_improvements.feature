
Feature: Service Tooltip

  Background:
    Given I am signed in to Orders

  @tooltips_improvements
  Scenario: International Service Tooltip Tests
    Then Filter: Menu Item tooltip should be Collapse this panel.
    Then Filter: Collapse Panel