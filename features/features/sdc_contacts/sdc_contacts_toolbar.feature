Feature:  Contacts BVT - Contacts ToolBar

  Background:
    Given Start test driver

  @sdc_contact_add_new_contact1
  Scenario: Contacts BVT Scenario 1 : Click add, add new contact  and the open and view details
    Then sign-in to orders
    Then add new order
    Then navigate to contacts
    Then delete all available contacts with the value NewContact
    Then expect count of contact search results is 0
    Then close the search results by clicking on remove button
    Then click contacts toolbar add button
    Then set contact details to
      | full_name   | company      | street_address |  city | state | postal_code    | country       | phone  |  email |    reference_number|   groups     |
      | AlohaLydia | company123  | Urb San Francisco |San Juan  | Puerto Rico     |  00927-5827  | United States | 233451525  | alolyd@gmail.com  | refrence1a2b | group 1 |

    Then On Left Navigation menu search contact {full_name}
    Then In Contacts Grid Check Row 1

  @sdc_contacts_add_new_contact
   Scenario: Add new Contact Top Nav Scenario 1 :Click add, add new contact  and the open and view details
    Then sign-in to orders
    Then pause for 5 seconds
    Then navigate to contacts
    Then pause for 5 seconds
    #Then delete all available contacts with the value NewContact
    #Then expect count of contact search results is 0
    #Then close the search results by clicking on remove button
    #Then click contacts toolbar add button
    #Then set contact details name to BG NewContact Add Verify
    #Then set contact details company to FL Homes
    #Then click on contact details panel company expand button
    #Then set contact details department to Home Department
    #Then set contact details title to Home Furnishings
    #Then set contact details country to United States
    #Then set contact details country to India
    #Then set contact details street address to  223 E. Concord Street
    #Then set contact details city to Orlando
    #Then set contact details Province to Telengana
    #Then set contact details state to Florida
    #Then set contact details postal code to 32801
    #Then set contact details email to new@contact.add
    #Then set contact details phone to 23345152
    #Then set contact details phone extension to 987
    #Then set contact details groups to group1
    #Then set contact details reference number to ref00012
    #Then set contact details cost code to Costcode1
    #Then in contacts grid uncheck row 1
    Then on left navigation menu search contact NewContact
    Then expect count of contact search results is 1
    #== Validation in Contacts Grid
    #Then expect value of Name in contacts grid is BG NewContact Add Verify
    #Then expect value of Prefix in contacts grid is BG
    #Then expect value of First Name in contacts grid is NewContact
    #Then expect value of Middle Name in contacts grid is Add
    #Then expect value of Last Name in contacts grid is Verify
    #Then expect value of Suffix in contacts grid is blank
    #Then expect value of Company in contacts grid is FL Homes
    #Then expect value of Title in contacts grid is Home Furnishings
    #Then expect value of Department in contacts grid is Home Department
    #Then expect value of Country in contacts grid is United States
    #Then expect value of Street Address in contacts grid is  223 E. Concord Street
    #Then expect value of City in contacts grid is Orlando
    #Then expect value of Province in contacts grid is blank
    #Then expect value of State/Prv in contacts grid is Florida
    #** check postal code
    Then expect value of Postal Code in contacts grid is 32801
    #Then expect value of Email in contacts grid is new@contact.add
    #Then expect value of Phone in contacts grid is 23345152
    #Then expect value of Phone Extension in contacts grid is 987
    #Then expect value of Reference Number in contacts grid is ref00012
    #Then expect value of Cost Code in contacts grid is Costcode1
    # Validation in the Details Panel
    Then in contacts grid check row 1
    #Then expect value of Name in contacts detail panel is BG NewContact Add Verify
    #Then click on contact details panel name expand button
    #Then expect value of Prefix in contacts detail panel is BG
    #Then expect value of First Name in contacts detail panel is NewContact
    #Then expect value of Middle Name in contacts detail panel is Add
    #Then expect value of Last Name in contacts detail panel is Verify
    #Then expect value of Suffix in contacts detail panel is blank
    #Then expect value of Company in contacts detail panel is FL Homes
    #Then click on contact details panel company expand button
    #Then expect value of Title in contacts detail panel is Home Furnishings
    #Then expect value of Department in contacts detail panel is Home Department
    #Then expect value of Country in contacts detail panel is United States
    #Then expect value of Street Address in contacts detail panel is  223 E. Concord Street
    #Then expect value of City in contacts detail panel is Orlando
    #Then expect value of State in contacts detail panel is Florida
    #Then expect value of Postal Code in contacts detail panel is 32801
    #Then expect value of Email in contacts detail panel is new@contact.add
    #Then expect value of Phone in contacts detail panel is 23345152
    Then expect value of Phone Extension in contacts detail panel is 987
    Then expect value of Groups in contacts detail panel is group1
    Then expect value of Reference Number in contacts detail panel is ref00012
    Then expect value of Cost Code in contacts detail panel is Costcode1

  @sdc_contacts_delete_single_from_top_navigation
  Scenario: Delete Contact Top Nav Scenario 1 :Delete a newly added contact from top navigation
    Then sign-in to orders
    Then navigate to contacts
    Then delete all available contacts with the value RuthAnand
    Then expect count of contact search results is 0
    Then close the search results by clicking on remove button
    Then click contacts toolbar add button
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
  Scenario: Add Reference Number from Top Nav Scenario 1 :Add an Invalid Reference to an Existing Contact via Contacts Toolbar
    Then sign-in to orders
    Then navigate to contacts
    Then delete all available contacts with the value AddInValidReference
    Then expect count of contact search results is 0
    Then close the search results by clicking on remove button
    Then click contacts toolbar add button
    Then set contact details name to AddInValidReference
    Then set contact details reference number to valid
    Then in contacts grid uncheck row 1
    Then on left navigation menu search contact AddInValidReference
    Then expect count of contact search results is 1
    Then in contacts grid check row 1
    Then click contacts toolbar add reference button
    Then set reference number to Invalid Reference1 Reference2 Reference3
    Then expect reference number error is displayed
    Then click on add reference close button
    Then expect value of Reference Number in contacts grid is valid

  @sdc_contacts_existing_add_valid_reference_number
  Scenario: Add Reference Number from Top Nav Scenario 2 :Add an Valid Reference to an Existing Contact via Contacts Toolbar
    Then sign-in to orders
    Then navigate to contacts
    Then delete all available contacts with the value AddValidReference
    Then expect count of contact search results is 0
    Then close the search results by clicking on remove button
    Then click contacts toolbar add button
    Then set contact details name to AddValidReference
    Then in contacts grid uncheck row 1
    Then on left navigation menu search contact AddValidReference
    Then expect count of contact search results is 1
    Then in contacts grid check row 1
    Then click contacts toolbar add reference button
    Then set reference number to Reference 123456789
    Then expect reference number error is not displayed
    Then click on add reference save button
    Then expect value of Reference Number in contacts grid is Reference 123456789

  @sdc_contacts_change_cost_code
  Scenario: Contacts BVT Scenario 1: Change Cost Code to an Existing Contact via Contacts Toolbar
    Then sign-in to orders
    Then pause for 5 seconds
    Then Navigate to Contacts
    Then pause for 5 seconds
    Then in contacts grid check row header
    Then In Contacts Grid Check Row 1
    Then Click Contacts Toolbar Cost Codes Dropdown
    Then Select Cost Codes to Change Cost Code
    Then Set Cost code value in the Change Costcode pop up box to sam1
    Then click on cost code save button
    Then expect value of Cost Code in contacts grid is sam1