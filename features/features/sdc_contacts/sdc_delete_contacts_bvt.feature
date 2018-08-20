Feature:  Contacts BVT

  Background:
    Given Start test driver

  @sdc_contacts_delete_single_from_top_navigation
  Scenario: Contacts BVT Scenario 1 :Delete a newly added contact from top navigation
    Then sign-in to orders
    Then navigate to contacts
    Then click contacts add button
    Then set contact details name to RuthAnand
    Then set contact details company to FL Homes
    Then set contact details country to United States
    #Then set contact details country to India
    Then set contact details street address to  223 E. Concord Street
    Then set contact details city to Orlando
    #Then set contact details Province to Telengana
    Then set contact details state to Florida
    Then set contact details postal code to 32801
    Then set contact details email to ruthanand@gmail.com
    Then set contact details phone to 23345152
    Then set contact details phone extension to 987
    Then set contact details groups to group1
    Then set contact details reference number to ref00012
    Then set contact details cost code to Costcode1
    Then In Contacts Grid Uncheck Row 1
    Then On Left Navigation menu search contact RuthAnand
    Then In Contacts Grid Check Row 1
    Then click contacts delete button
    Then Expect Contacts Delete Message Box is Available
    Then delete contacts message box click on Yes button
    Then On Left Navigation menu search contact RuthAnand

  @sdc_contacts_delete_multiple_from_top_navigation
  Scenario: Contacts BVT Scenario 1 :Delete multiple contacts from top navigation
    Then sign-in to orders
    Then navigate to contacts
    Then On Left Navigation menu search contact Jon
    Then In Contacts Grid Check Row 1
    Then In Contacts Grid Check Row 4
    Then click contacts delete button
    Then Expect Contacts Delete Message Box is Available
    Then delete contacts message box click on Yes button

  @sdc_contacts_delete_single_from_details_menu
  Scenario: Contacts BVT Scenario 1 :Delete multiple contacts from details panel
    Then sign-in to orders
    Then navigate to contacts
    Then click contacts add button
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
    Then In Contacts Grid Uncheck Row 1
    Then On Left Navigation menu search contact Anand Raj
    Then In Contacts Grid Check Row 1
    Then click on contact details menu dropdown
    Then select Delete from dropdown menu
    Then Expect Contacts Delete Message Box is Available
    Then delete contacts message box click on Yes button
