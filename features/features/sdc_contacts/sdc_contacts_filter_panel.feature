Feature:  Contacts BVT - Contacts Filter Panel

  Background:
    Given Start test driver

  @sdc_contacts_left_panel_regression
  Scenario: Contacts Filter Panel Hide/Show: Collapse and expand contacts Left navigation Filter Panel
  Contacts Filter Panel Cost Code Expand/Collapse: Collapse and expand contacts Left navigation Cost Codes Filter Panel
  Contacts Filter Panel Cost Code count: Expand contacts Left navigation individual Cost Codes count
  Contacts Filter Panel Groups Expand/Collapse: Collapse and expand contacts Left navigation Cost Codes Filter Groups
  Contacts Filter Panel All Contacts count :Left filter panel contact count
    Then sign-in to orders
    Then navigate to Contacts
    #Contacts Filter Panel All Contacts count :Left filter panel contact count
    Then fetch total count of all contacts
    # Contacts Filter Panel Hide/Show: Collapse and expand contacts Left navigation Filter Panel
    Then click on collapse button of contacts left navigation
    Then click on expand button of contacts left navigation
    # Contacts Filter Panel Cost Code Expand/Collapse: Collapse and expand contacts Left navigation Cost Codes Filter Panel
    Then click on cost codes expand button of contacts left navigation
    Then click on cost codes collapse button of contacts left navigation
    # Contacts Filter Panel Cost Code count: Expand contacts Left navigation individual Cost Codes count
    Then click on cost codes expand button of contacts left navigation
    Then fetch total against each cost code available
    # Contacts Filter Panel Groups Expand/Collapse: Collapse and expand contacts Left navigation Cost Codes Filter Groups
    Then click on groups expand button of contacts left navigation
    Then click on groups collapse button of contacts left navigation
    # Contacts Filter Panel Group count: Expand contacts Left navigation individual Group count
    Then click on groups expand button of contacts left navigation
    Then fetch total against each group available

  @sdc_contacts_left_navigation_add_group
  Scenario: Contacts BVT Scenario 1: Add new group from contact left navigation
    Then sign-in to orders
    Then navigate to Contacts
    # Groups Left Navigation plus Button - Add
    Then mousehover on groups section of left navigation
    Then click on groups add button of contacts left navigation
    Then set group name on add group pop up to blank
    Then click on save button of add groups pop up window
    Then expect error message of blank group name is displayed on add groups pop up window
    Then set group name on add group pop up to existing
    Then click on save button of add groups pop up window
    Then expect error message of existing group name is displayed on add groups pop up window
    Then set group name on add group pop up to random
    Then click on save button of add groups pop up window
    Then expect error message is not displayed on add groups pop up window

  @sdc_contacts_left_add_edit_group
  Scenario: Contacts BVT Scenario 1: Add/Edit group from contact left navigation
    Then sign-in to orders
    Then navigate to Contacts
    # Groups Left Navigation settings Button - Add from (manage groups)
    Then mousehover on groups section of left navigation
    Then click on groups settings button of contacts left navigation
    Then expect manage groups pop up is displayed
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
    # Groups Left Navigation settings Button - Edit and delete from (manage groups)
    Then click existing row in manage group table
    Then click edit button on manage groups window toolbar
    Then set group name on edit pop up to blank
    Then click on save button of edit groups pop up
    Then expect error message of blank group name is displayed on edit groups pop up window
    Then set group name on edit pop up to existing
    Then click on save button of edit groups pop up
    Then expect error message of existing group name is displayed on edit groups pop up window
    Then set group name on edit pop up to random
    Then click on save button of edit groups pop up
    Then expect error message is not displayed on edit groups pop up window
    Then expect manage groups pop up is displayed
    Then expect group name added is available in the manage group pop up table
    Then click existing row in manage group table
    Then click delete button on manage groups window toolbar
    Then click on yes button of delete groups pop up
    Then expect manage groups pop up is displayed
    Then expect group name deleted is not available in the manage group pop up table


  @sdc_contacts_left_nav_add_edit_cost_code
  Scenario: Contacts BVT Scenario 1: Add/Edit cost code from contact left navigation
    Then sign-in to orders
    Then navigate to Contacts
    Then mousehover on cost codes section of left navigation
    Then click on cost codes settings button of contacts left navigation
    Then expect cost code page is displayed
    Then on cost code page set value of new cost code textbox to existing value
    Then on cost codes page click on add button
    Then expect error message box is displayed
    Then on cost code page set value of new cost code textbox to random
    Then on cost codes page click on add button
    Then expect error message box is not displayed
    Then on cost codes page click on done button
    Then navigate to Contacts
    Then click on cost codes expand button of contacts left navigation
    Then on left navigation expect new costcode added is avilable under costcode filter
    Then on left navigation expect count of new costcode added is 0
    Then in contacts grid check row 1
    Then click contacts toolbar cost codes dropdown
    Then on cost codes dropdown menu select Change Cost Code
    Then set cost code value in the change costcode pop up box to new costcode added
    Then click on cost code save button
    Then expect value of Cost Code in contacts grid is correct?


