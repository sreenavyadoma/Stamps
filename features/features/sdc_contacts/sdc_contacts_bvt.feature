Feature:  Contacts BVT - Add Valid , Invalid Email

  Background:
    Given Start test driver

  @sdc_contacts_bvt_1
  Scenario: Contacts BVT Scenario 1 :Add valid Email to a newly added contact via contact details modal
    Then sign-in to orders
    Then navigate to contacts
    Then click contacts add button
    Then set contact details name to Aloha9154
    Then set contact details company to Stamps1
    #Then set contact details country to United States
    Then set contact details country to India
    Then set contact details street address to  street1, road 2, lane 3
    Then set contact details city to Hyderabad
    #Then set contact details state to Florida
    Then set contact details Province to Telengana
    Then set contact details postal code to 500084
    Then set contact details phone to 23345152
    Then set contact details phone extension to 987
    Then set contact details groups to group1
    Then set contact details reference number to ref00012
    Then set contact details cost code to Costcode1
    Then In Contacts Grid Uncheck Row 1
    Then On Left Navigation menu search contact Aloha9154
    Then In Contacts Grid Check Row 1
    Then set contact details email to aanand@123stamps.com

  @sdc_contacts_bvt_2
  Scenario: Contacts BVT Scenario 1 :Add Invalid Email to a newly added contact via contact details modal
    Then sign-in to orders
    Then navigate to contacts
    Then click contacts add button
    Then set contact details name to Jon Marsa
    Then set contact details company to FL Homes
    Then set contact details country to United States
    #Then set contact details country to India
    Then set contact details street address to  223 E. Concord Street
    Then set contact details city to Orlando
    #Then set contact details Province to Telengana
    Then set contact details state to Florida
    Then set contact details postal code to 32801
    Then set contact details phone to 23345152
    Then set contact details phone extension to 987
    Then set contact details groups to group1
    Then set contact details reference number to ref00012
    Then set contact details cost code to Costcode1
    Then In Contacts Grid Uncheck Row 1
    Then On Left Navigation menu search contact Jon
    Then In Contacts Grid Check Row 1
    Then set contact details email to Jon.com
    Then expect email error is displayed

  @sdc_contacts_bvt_3
  Scenario: Contacts BVT Scenario 1 :Add Invalid Email to an existing contact via contact details modal
    Then sign-in to orders
    Then navigate to contacts
    Then On Left Navigation menu search contact Jon
    Then In Contacts Grid Check Row 1
    Then set contact details email to Jon123@stamps

  @sdc_contacts_bvt_4
  Scenario: Contacts BVT Scenario 1 :Add valid Email to an existing contact via contact details modal
    Then sign-in to orders
    Then navigate to contacts
    Then On Left Navigation menu search contact Jon
    Then In Contacts Grid Check Row 1
    Then set contact details email to Jon123@stamps.com
