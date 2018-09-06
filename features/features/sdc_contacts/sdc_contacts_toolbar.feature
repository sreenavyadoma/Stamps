Feature:  Contacts BVT - Contacts ToolBar

  Background:
    Given Start test driver

  @sdc_contacts_delete_single_from_top_navigation
  Scenario: Delete Contact Top Nav Scenario 1 :Delete a newly added contact from top navigation
    Then Sign-in to Orders
    Then Navigate to Contacts
    Then Click Contacts Toolbar Add Button
    Then Set Contact Details Name to RuthAnand
    Then Set Contact Details Company to FL Homes
    Then Set Contact Details Country to United States
    Then Set Contact Details Country to India
    Then Set Contact Details Street Address to  223 E. Concord Street
    #Then Set Contact Details City to Orlando
    Then Set Contact Details Province to Telengana
    #Then Set Contact Details State to Florida
    Then Set Contact Details Postal Code to 32801
    Then Set Contact Details Email to ruthanand@gmail.com
    Then Set Contact Details Phone to 23345152
    Then Set Contact Details Phone Extension to 987
    Then Set Contact Details Groups to group1
    Then Set Contact Details Reference Number to ref00012
    Then Set Contact Details Cost Code to Costcode1
    Then In Contacts Grid Uncheck Row 1
    Then On Left Navigation Menu Search Contact Ruth
    Then Expect Count of Contact Search Results is 1
    Then In Contacts Grid Check Row 1
    Then Click Contacts Toolbar Delete Button
    Then Expect Contacts Delete Message Box is Available
    Then Delete Contacts Message Box Click on Yes Button
    Then On Left Navigation menu search contact Ruth
    Then Expect Count of Contact Search Results is 0

  @sdc_contacts_delete_multiple_from_top_navigation
  Scenario: Delete Contact Top Nav Scenario 2 :Delete multiple contacts from top navigation
    Then sign-in to orders
    Then navigate to contacts
    Then delete all available contacts with the value Jon
    Then expect count of contact search results is 0
    Then close the search results by clicking on remove button
    Then click contacts toolbar add button
    Then set contact details name to Jon1
    Then in contacts grid uncheck row 1
    Then click contacts toolbar add button
    Then set contact details name to Jon2
    Then in contacts grid uncheck row 1
    Then click contacts toolbar add button
    Then set contact details name to Jon3
    Then in contacts grid uncheck row 1
    Then on left navigation menu search contact Jon
    Then expect count of contact search results is 3
    Then in contacts grid check row 1
    Then In contacts grid check row 3
    Then click contacts toolbar delete button
    Then delete contacts message box click on yes button
    Then on left navigation menu search contact Jon
    Then expect count of contact search results is 1

  @sdc_contacts_existing_add_invalid_reference_number
  Scenario: Contacts BVT Scenario 1 :Add an Invalid Reference to an Existing Contact via Contacts Toolbar
    Then sign-in to orders
    Then navigate to contacts
    Then in contacts grid check row 1
    Then click contacts toolbar add reference button
    Then set reference number to Reference1 Reference2 Reference3 456123
    Then expect reference number error is displayed

  @sdc_contacts_existing_add_valid_reference_number
  Scenario: Contacts BVT Scenario 1 :Add an Valid Reference to an Existing Contact via Contacts Toolbar
    Then sign-in to orders
    Then navigate to contacts
    Then in contacts grid check row 1
    Then click contacts toolbar add reference button
    Then set reference number to Reference 123456789
    Then expect reference number error is not displayed
    Then click on add reference save button
    Then expect value of Reference Number in contacts grid is Reference 123456789

  @sdc_contacts_change_cost_code
  Scenario: Contacts BVT Scenario 1: Change Cost Code to an Existing Contact via Contacts Toolbar
    Then Sign-in to Orders
    Then pause for 5 seconds
    Then Navigate to Contacts
    Then In Contacts Grid Check Row 1
    Then Click Contacts Toolbar Cost Codes Dropdown
    Then Select Cost Codes to Change Cost Code
    Then Set Cost code value in the Change Costcode pop up box to sam1
    Then click on cost code save button
    Then expect value of Cost Code in contacts grid is sam1