Feature:  Contacts BVT - Contacts ToolBar

  Background:
    Given Start test driver

  @sdc_contact_add_new_contact
  Scenario: Contacts BVT Scenario 1 : Click add, add new contact  and the open and view details
    Then sign-in to orders
    Then navigate to Contacts
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |random     |random   |United States|random     |San Juan|Federated States Of Micronesia|0097-5824|random|random  |random   |random |random     |
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name newly added
    Then in contacts grid check row 1
    Then expect values of contact added in contacts grid are correct
    Then expect values of contact added in contacts detail panel are correct

  @sdc_contacts_delete_single_from_top_navigation
  Scenario: Delete Contact Top Nav Scenario 1 :Delete a newly added contact from top navigation
    Then sign-in to orders
    Then navigate to Contacts
    Then delete all available contacts with the value RuthAnand
    Then expect count of contact search results is 0
    Then click remove button on search results of contacts filter
    Then click add button on contacts toolbar
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
    Then search contacts from contacts filter panel with name Ruth
    Then Expect Count of Contact Search Results is 1
    Then In Contacts Grid Check Row 1
    Then click delete button on contacts toolbar
    Then expect delete contacts modal is displayed
    Then click yes button on delete contacts modal
    Then search contacts from contacts filter panel with name Ruth
    Then Expect Count of Contact Search Results is 0

  @sdc_contacts_delete_multiple_from_top_navigation
  Scenario: Delete Contact Top Nav Scenario 2 :Delete multiple contacts from top navigation
    Then sign-in to orders
    Then navigate to Contacts
    Then delete all available contacts with the value Jon
    Then expect count of contact search results is 0
    Then click remove button on search results of contacts filter
    Then click add button on contacts toolbar
    Then set contact details name to Jon1
    Then in contacts grid uncheck row 1
    Then click add button on contacts toolbar
    Then set contact details name to Jon2
    Then in contacts grid uncheck row 1
    Then click add button on contacts toolbar
    Then set contact details name to Jon3
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name Jon
    Then expect count of contact search results is 3
    Then in contacts grid check row 1
    Then In contacts grid check row 3
    Then click delete button on contacts toolbar
    Then click yes button on delete contacts modal
    Then search contacts from contacts filter panel with name Jon
    Then expect count of contact search results is 1

  @sdc_contacts_existing_add_invalid_reference_number
  Scenario: Add Reference Number from Top Nav Scenario 1 :Add an Invalid Reference to an Existing Contact via Contacts Toolbar
    Then sign-in to orders
    Then navigate to Contacts
    Then delete all available contacts with the value AddInValidReference
    Then expect count of contact search results is 0
    Then click remove button on search results of contacts filter
    Then click add button on contacts toolbar
    Then set contact details name to AddInValidReference
    Then set contact details reference number to valid
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name AddInValidReference
    Then expect count of contact search results is 1
    Then in contacts grid check row 1
    Then click add reference button on contacts toolbar
    Then set reference number to Invalid Reference1 Reference2 Reference3
    Then expect reference number error is displayed
    Then click on add reference close button
    Then expect value of Reference Number in contacts grid is valid

  @sdc_contacts_existing_add_valid_reference_number
  Scenario: Add Reference Number from Top Nav Scenario 2 :Add an Valid Reference to an Existing Contact via Contacts Toolbar
    Then sign-in to orders
    Then navigate to Contacts
    Then delete all available contacts with the value AddValidReference
    Then expect count of contact search results is 0
    Then click remove button on search results of contacts filter
    Then click add button on contacts toolbar
    Then set contact details name to AddValidReference
    Then in contacts grid uncheck row 1
    Then search contacts from contacts filter panel with name AddValidReference
    Then expect count of contact search results is 1
    Then in contacts grid check row 1
    Then click add reference button on contacts toolbar
    Then set reference number to Reference 123456789
    Then expect reference number error is not displayed
    Then click on add reference save button
    Then expect value of Reference Number in contacts grid is Reference 123456789

 @sdc_contacts_toolbar_settings_show_hide_all_columns
  Scenario: Contacts BVT Scenario 1 : Select columns to show/hide in the Grid
    Then sign-in to orders
    Then navigate to Contacts
    Then click on settings button of contacts toolbar
    Then select columns from contacts toolbar settings dropdown menu
    Then check all the columns from the list to show all columns in the contacts grid
    Then expect all columns are available on the contacts grid
    Then click on settings button of contacts toolbar
    Then select columns from contacts toolbar settings dropdown menu
    Then uncheck all the columns from the list to hide all columns in the contacts grid
    Then expect all columns are not available on the contacts grid
