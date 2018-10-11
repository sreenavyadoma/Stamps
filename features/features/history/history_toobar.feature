Feature:  History Toolbar

  Background:
    Given Start test driver

  @history_filter_panel
  Scenario: History Filter Panel functions
    Then sign-in to orders
    Then navigate to History
    Then select row 1 on history grid
    Then click refund button on history toolbar
