Feature:  Contacts BVT - Contacts Cost Codes

  Background:
    Given Start test driver

  @sdc_contacts_toolbar_add_existing_cost_code_toolbar
  Scenario: Add Cost Code scenario 1: Add cost code from TOP Nav ,Sent to Cost codes page, add an exsisting cost code and expect error is displayed and make sure cost codes save and visible on contacts page
    Then sign-in to orders
    Then navigate to contacts
    Then on contacts left navigation click on cost codes expand button
    Then click contacts toolbar cost codes dropdown
    Then on cost codes dropdown menu select Add/Edit Cost Codes
    Then expect cost code page is displayed
    Then on cost code page set value of new cost code textbox to existing value
    Then on cost codes page click on add button
    Then expect error message box is displayed

  @sdc_contacts_toolbar_add_new_cost_code_toolbar
  Scenario: Add Cost Code scenario 1: Add cost code from TOP Nav ,Sent to Cost codes page, add an new cost code and expect error is not displayed and make sure cost codes save and visible on contacts page
    Then sign-in to orders
    Then navigate to contacts
    Then click contacts toolbar cost codes dropdown
    Then on cost codes dropdown menu select Add/Edit Cost Codes
    Then expect cost code page is displayed
    Then on cost code page set value of new cost code textbox to random
    Then on cost codes page click on add button
    Then expect error message box is not displayed
    Then on cost codes page click on done button
    Then navigate to contacts
    Then on contacts left navigation click on cost codes expand button
    Then on left navigation expect new costcode added is avilable under costcode filter
    Then on left navigation expect count of new costcode added is 0
    Then in contacts grid check row 1
    Then click contacts toolbar cost codes dropdown
    Then on cost codes dropdown menu select Change Cost Code
    Then set cost code value in the change costcode pop up box to new costcode added
    Then click on cost code save button
    Then expect value of Cost Code in contacts grid is correct?
    Then on left navigation expect count of new costcode added is 1

  @sdc_contacts_change_cost_code_add_new
  Scenario: Contacts BVT Scenario 1: Add Cost Code from change cost codes pop up via Contacts Toolbar
    Then sign-in to orders
    Then navigate to contacts
    Then in contacts grid check row 1
    Then click contacts toolbar cost codes dropdown
    Then on cost codes dropdown menu select Change Cost Code
    Then set cost code value in the change costcode pop up box to Add/Edit Cost Codes
    Then expect cost code page is displayed
    Then on cost code page set value of new cost code textbox to random
    Then on cost codes page click on add button
    Then expect error message box is not displayed
    Then on cost codes page click on done button
    Then navigate to contacts
    Then in contacts grid check row 1
    Then set new costcode added value in details menu cost code dropdown
    Then on contacts left navigation click on cost codes expand button
    Then on left navigation expect count of new costcode added is 1

  @sdc_contacts_change_to_existing_cost_code
  Scenario: Contacts BVT Scenario 2: Change Cost Code to an Existing Contact via Contacts Toolbar
    Then sign-in to orders
    Then navigate to contacts
    Then on contacts left navigation click on cost codes expand button
    Then in contacts grid check row 1
    Then click contacts toolbar cost codes dropdown
    Then on cost codes dropdown menu select Change Cost Code
    Then set cost code value in the change costcode pop up box to existing value
    Then click on cost code save button
    Then expect value of Cost Code in contacts grid is existing value?