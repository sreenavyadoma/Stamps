Feature:  Contacts BVT - Contacts ToolBar

  Background:
    Given Start test driver

  @sdc_contacts_toolbar_add_group
  Scenario: Contacts BVT Scenario 1: Add new Group via Contacts Toolbar
    Then sign-in to orders
    Then navigate to contacts
    Then click on groups menu dropdown on contacts toolbar
    Then select Add/Edit Groups from groups menu dropdown of contacts toolbar
    Then click add button on manage groups window toolbar
    Then set group name on add group pop up to blank
    Then click on save button of add groups pop up window
    Then expect error message of blank group name is displayed on add groups pop up window
    Then set group name on add group pop up to existing
    Then click on save button of add groups pop up window
    Then expect error message of existing group name is displayed on add groups pop up window
    Then set group name on add group pop up to random
    Then click on save button of add groups pop up window
    Then expect error message is not displayed on add groups pop up window
    Then expect manage groups pop up is displayed
    Then expect group name added is available in the manage group pop up table
