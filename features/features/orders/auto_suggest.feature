
Feature: Domestic Address

  Background:
    Given I am signed in to Orders

  @auto_suggest
  Scenario: Auto Suggest for Domestic Addresses
    Then Orders Toolbar: Add
    #Matching first name
    Then Order Details: Set Ship-To auto-suggest address to partial name Firstname
    Then Order Details: Expect auto-suggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then Order Details: Select Ship-To auto-suggest item 1
    Then Order Details: Expect Domestic Ship-To Name is Firstname Lastname
    Then Order Details: Expect Domestic Ship-To Company is CompanyNameZoneOne
    Then Sign out

  @auto_suggest_international
  Scenario: Select International Address
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-To Country to Italy
    Then Order Details: Set International Ship-To auto-suggest address to partial name Com
    Then Order Details: Expect auto-suggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then Order Details: Expect auto-suggest pop-up entry for Firstname Venice, Lastname Florence, Company CompanyNameInternational
    Then Order Details: Select Ship-To auto-suggest item 1
    Then Order Details: Set International Ship-To auto-suggest address to partial name Flo
    Then Order Details: Select Ship-To auto-suggest item 1
    Then Order Details: Expect International Ship-To Name is Venice Florence
    Then Order Details: Expect International Ship-To Company is CompanyNameInternational
    Then Order Details: Expect International Ship-To Address 1 is Italian Street address
    Then Order Details: Expect International Ship-To City is ItalianCity
    Then Order Details: Expect International Ship-To Province is Rome
    Then Order Details: Expect International Ship-To Postal Code is Pisa
    Then Order Details: Expect International Ship-To Phone is 41511111111
    Then Order Details: Expect International Ship-To Email is autosuggest001.2@mailinator.com
    Then Sign out
