
Feature: Domestic Address

  Background:
    Given a valid user is signed in to Web Apps

  @auto_suggest
  Scenario: Auto Suggest for Domestic Addresses
    Then in Orders Toolbar, click Add button
    #Matching first name
    Then set Order Details form Ship-To auto-suggest address to partial name Firstname
    Then expect Order Details form auto-suggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then on Order Details form, select Ship-To auto-suggest item 1
    Then expect Order Details form Domestic Ship-To Name is Firstname Lastname
    Then expect Order Details form Domestic Ship-To Company is CompanyNameZoneOne
    Then Sign out

  @auto_suggest_international
  Scenario: Select International Address
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-To Country to Italy
    Then set Order Details form International Ship-To auto-suggest address to partial name Com
    Then expect Order Details form auto-suggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then expect Order Details form auto-suggest pop-up entry for Firstname Venice, Lastname Florence, Company CompanyNameInternational
    Then on Order Details form, select Ship-To auto-suggest item 1
    Then set Order Details form International Ship-To auto-suggest address to partial name Flo
    Then on Order Details form, select Ship-To auto-suggest item 1
    Then expect Order Details form International Ship-To Name is Venice Florence
    Then expect Order Details form International Ship-To Company is CompanyNameInternational
    Then expect Order Details form International Ship-To Address 1 is Italian Street address
    Then expect Order Details form International Ship-To City is ItalianCity
    Then expect Order Details form International Ship-To Province is Rome
    Then expect Order Details form International Ship-To Postal Code is Pisa
    Then expect Order Details form International Ship-To Phone is 41511111111
    Then expect Order Details form International Ship-To Email is autosuggest001.2@mailinator.com
    Then Sign out
