
Feature: Domestic Address

  Background:
    Given I am signed in to Orders

  @auto_suggest
  Scenario: Auto Suggest for Domestic Addresses
    Then Toolbar: Add
    #Matching first name
    Then Details: Set Ship-To auto-suggest address to partial name Firstname
    Then Details: Expect auto-suggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then Details: Select Ship-To auto-suggest item 1
    Then Details: Expect Domestic Ship-To Name is Firstname Lastname
    Then Details: Expect Domestic Ship-To Company is CompanyNameZoneOne
    Then Sign out

  @auto_suggest_international
  Scenario: Select International Address
    Then Toolbar: Add
    Then Details: Set Ship-To Country to Italy
    Then Details: Set International Ship-To auto-suggest address to partial name Com
    Then Details: Expect auto-suggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then Details: Expect auto-suggest pop-up entry for Firstname Venice, Lastname Florence, Company CompanyNameInternational
    Then Details: Select Ship-To auto-suggest item 1
    Then Details: Set International Ship-To auto-suggest address to partial name Flo
    Then Details: Select Ship-To auto-suggest item 1
    Then Details: Expect International Ship-To Name is Venice Florence
    Then Details: Expect International Ship-To Company is CompanyNameInternational
    Then Details: Expect International Ship-To Address 1 is Italian Street address
    Then Details: Expect International Ship-To City is ItalianCity
    Then Details: Expect International Ship-To Province is Rome
    Then Details: Expect International Ship-To Postal Code is Pisa
    Then Details: Expect International Ship-To Phone is 41511111111
    Then Details: Expect International Ship-To Email is autosuggest001.2@mailinator.com
    Then Sign out
