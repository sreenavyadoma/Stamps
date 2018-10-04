Feature:  History Filter Panel

  Background:
    Given Start test driver

  @history_filter_panel
  Scenario: History Filter Panel functions
    Then sign-in to orders
    Then navigate to History
    Then expand date printed on history filter panel
    Then select date printer today on history filter panel
    Then expect date printed today is selected on history filter panel
    Then expect history filter panel date printed count for today is greater than 0

