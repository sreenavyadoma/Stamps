Feature:  Contacts BVT - Contacts Details

  Background:
    Given Start test driver

  @sdc_contacts_delete_single_from_details_menu
  Scenario: Delete Contact Details Menu Scenario 1:Delete single contacts from details panel
    Then sign-in to orders
    Then navigate to contacts
    Then delete all available contacts with the value Anand Raj
    Then expect count of contact search results is 0
    Then close the search results by clicking on remove button
    Then click contacts toolbar add button
    Then set contact details name to Anand Raj
    Then set contact details company to FL Homes
    Then set contact details country to United States
    #Then set contact details country to India
    Then set contact details street address to  223 E. Concord Street
    Then set contact details city to Orlando
    #Then set contact details Province to Telengana
    Then set contact details state to Florida
    Then set contact details postal code to 32801
    Then set contact details email to anand@gmail.com
    Then set contact details phone to 23345152
    Then set contact details phone extension to 987
    Then set contact details groups to group1
    Then set contact details reference number to ref00012
    Then set contact details cost code to Costcode1
    Then in contacts grid uncheck row 1
    Then on left navigation menu search contact Anand Raj
    Then expect count of contact search results is 1
    Then in contacts grid check row 1
    Then click on contact details menu dropdown
    Then select Delete from dropdown menu
    Then expect contacts delete message box is available
    Then delete contacts message box click on yes button
    Then on left navigation menu search contact Anand Raj
    Then expect count of contact search results is 0

  @sdc_contacts_delete_multiple_from_details_menu
  Scenario: Delete Contact Details Menu Scenario 2 :Delete multiple contacts from Details Panel
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
    Then click on contact details menu dropdown
    Then select Delete from dropdown menu
    Then expect contacts delete message box is available
    Then delete contacts message box click on yes button
    Then on left navigation menu search contact Jon
    Then expect count of contact search results is 1


  @sdc_contacts_add_valid_email
  Scenario: Contacts Add Email Scenario 1 :Add valid Email to a newly added contact via contact details modal
    Then sign-in to orders
    Then navigate to contacts
    Then delete all available contacts with the value Aloha9154
    Then expect count of contact search results is 0
    Then close the search results by clicking on remove button
    Then click contacts toolbar add button
    Then set contact details name to Aloha9154
    Then set contact details company to Stamps1
    #Then Set Contact Details country to United States
    Then set contact details country to India
    Then set contact details street address to  street1, road 2, lane 3
    Then set contact details city to Hyderabad
    #Then Set Contact Details ctate to Florida
    Then set contact details province to Telengana
    Then set contact details postal code to 500084
    Then set contact details phone to 23345152
    Then set contact details phone extension to 987
    Then set contact details groups to group1
    Then set contact details reference number to ref00012
    Then set contact details cost code to Costcode1
    Then in contacts grid uncheck row 1
    Then on left navigation menu search contact Aloha9154
    Then in contacts grid check row 1
    Then set contact details email to aanand@123stamps.com
    Then expect email error is not displayed
    Then close the search results by clicking on remove button
    Then on left navigation menu search contact Aloha9154
    Then expect value of Email in contacts grid is aanand@123stamps.com

  @sdc_contacts_add_invalid_email
  Scenario: Contacts Add Email Scenario 2 :Add Invalid Email to a newly added contact via contact details modal
    Then sign-in to orders
    Then navigate to contacts
    Then delete all available contacts with the value Conatct Email Invalid
    Then expect count of contact search results is 0
    Then close the search results by clicking on remove button
    Then click contacts toolbar add button
    Then set contact details name to Contact Email Invalid
    Then set contact details company to FL Homes
    Then Set Contact Details country to United States
    #Then set contact details country to India
    Then set contact details street address to  223E. Concord Street
    Then set contact details city to Hyderabad
    Then Set Contact Details state to Florida
    #Then set contact details province to Telengana
    Then set contact details postal code to 32801
    Then set contact details phone to 23345152
    Then set contact details phone extension to 987
    Then set contact details groups to group1
    Then set contact details reference number to ref00012
    Then set contact details cost code to Costcode1
    Then in contacts grid uncheck row 1
    Then on left navigation menu search contact Contact Email Invalid
    Then in contacts grid check row 1
    Then set contact details email to invalid.com
    Then expect email error is displayed
    Then close the search results by clicking on remove button
    Then on left navigation menu search contact Aloha9154
    Then expect value of Email in contacts grid is blank


  @sdc_contacts_detail_name_singleName
  Scenario: Contacts Details Add Name Scenario 1 :Add/Edit Single Name in Contact Details panel and verify Grid is updated correctly
    Then sign-in to orders
    Then navigate to contacts
    Then delete all available contacts with the value CAPT P Al tha Lydia Anand
    Then expect count of contact search results is 0
    Then close the search results by clicking on remove button
    Then click contacts toolbar add button
    Then set contact details name to CAPT P Al tha Lydia Anand
    Then in contacts grid uncheck row 1
    Then on left navigation menu search contact CAPT P Al tha Lydia Anand
    Then expect count of contact search results is 1
    Then expect name details for CAPT P Al tha Lydia Anand in contacts grid is updated appropriately

  @sdc_contacts_detail_name_expand_collapse
  Scenario: Contacts Details Expand and Collapse Name Scenario 1 :Expand the Name field in Contact Details panel
    Then Sign-in to Orders
    Then Navigate to Contacts
    Then In Contacts Grid Check Row 1
    Then Click on Contact Details Panel Name Expand Button
    Then Click on Contact Details Panel Name Collapse Button

  @sdc_contacts_detail_name_all_details
  Scenario: Contacts Details Add Name Scenario 2 :Add/Edit All the Name fields(prefix, firstname, middlename, lastname, suffix) in Contact Details panel and verify Grid is updated correctly
    Then sign-in to orders
    Then navigate to contacts
    Then delete all available contacts with the value FirstName
    Then expect count of contact search results is 0
    Then close the search results by clicking on remove button
    Then click contacts toolbar add button
    Then click on contact details panel name expand button
    Then set contact details name prefix to CAPT
    Then set contact details firstName to FirstName
    Then set contact details middlename to MiddleName
    Then set contact details lastname to LastName
    Then set contact details suffix to Suffix
    Then click on contact details panel name collapse button
    Then in contacts grid uncheck row 1
    Then on left navigation menu search contact FirstName
    Then expect count of contact search results is 1
    Then expect value of Prefix in contacts grid is CAPT
    Then expect value of First Name in contacts grid is FirstName
    Then expect value of Middle Name in contacts grid is MiddleName
    Then expect value of Last Name in contacts grid is LastName
    Then expect value of Suffix in contacts grid is Suffix


  @sdc_contacts_detail_company_single
  Scenario: Contacts Details Add Company Scenario 1 :Add/Edit Single Company in Contact Details panel
    Then sign-in to orders
    Then navigate to contacts
    Then delete all available contacts with the value CompanySingle
    Then expect count of contact search results is 0
    Then close the search results by clicking on remove button
    Then click contacts toolbar add button
    Then set contact details name to CompanySingle
    Then in contacts grid uncheck row 1
    Then on left navigation menu search contact CompanySingle
    Then expect count of contact search results is 1
    Then in contacts grid check row 1
    Then set contact details company to Company123
    Then expect value of Company in contacts grid is Company123

  @sdc_contacts_detail_company_expand_collapse
  Scenario: Contacts Details Expand and Collapse Company Scenario 1 :Expand/Collapse the Company field in Contact Details panel
    Then sign-in to orders
    Then navigate to contacts
    Then In Contacts Grid Check Row 1
    Then Click on Contact Details Panel Company Expand Button
    Then Click on Contact Details Panel Company Collapse Button

  @sdc_contacts_detail_company_department_and_title_details
  Scenario: Contacts Details - Company Add Title and Department Scenario 1:Expand the Name field in Contact Details panel
    Then sign-in to orders
    Then navigate to contacts
    Then delete all available contacts with the value CompanyDetail
    Then expect count of contact search results is 0
    Then close the search results by clicking on remove button
    Then click contacts toolbar add button
    Then set contact details name to CompanyDetail
    Then click on contact details panel company expand button
    Then set contact details department to CompanyDepartment
    Then set contact details title to CompanyTitle
    Then click on contact details panel company collapse button
    Then in contacts grid uncheck row 1
    Then on left navigation menu search contact CompanyDetail
    Then expect count of contact search results is 1
    Then expect value of Title in contacts grid is CompanyTitle
    Then expect value of Department in contacts grid is CompanyDepartment
