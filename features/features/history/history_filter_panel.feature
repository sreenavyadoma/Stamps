Feature:  History Filter Panel

  Background:
    Given Start test driver

  @history_filter_panel
  Scenario: History Filter Panel functions
    Then sign-in to orders
    Then navigate to History
    Then expand date printed on history filter panel

    Then select today on history filter panel
    Then expect today is selected on history filter panel
    Then expect today count on history filter panel is greater than 0

    Then select past 30 days on history filter panel
    Then expect past 30 days is selected on history filter panel
    Then expect past 30 days count on history filter panel is greater than 0

