
Feature: Domestic Address

  Background:
    Given a valid user is signed in to Web Apps

  @auto_suggest
  Scenario: Auto Suggest for Domestic Addresses
    Then in Orders Toolbar, click Add button
    #Matching first name
    Then on Order Details form, set Ship-To auto-suggest address to partial name Firstname
    Then on Order Details form, expect auto-suggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then on Order Details form, select Ship-To auto-suggest item 1
    Then on Order Details form, expect Domestic Ship-To Name is Firstname Lastname
    Then on Order Details form, expect Domestic Ship-To Company is CompanyNameZoneOne
    Then Sign out

  @auto_suggest_international
  Scenario: Select International Address
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-To Country to Italy
    Then on Order Details form, set International Ship-To auto-suggest address to partial name Com
    Then on Order Details form, expect auto-suggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then on Order Details form, expect auto-suggest pop-up entry for Firstname Venice, Lastname Florence, Company CompanyNameInternational
    Then on Order Details form, select Ship-To auto-suggest item 1
    Then on Order Details form, set International Ship-To auto-suggest address to partial name Flo
    Then on Order Details form, select Ship-To auto-suggest item 1
    Then on Order Details form, expect International Ship-To Name is Venice Florence
    Then on Order Details form, expect International Ship-To Company is CompanyNameInternational
    Then on Order Details form, expect International Ship-To Address 1 is Italian Street address
    Then on Order Details form, expect International Ship-To City is ItalianCity
    Then on Order Details form, expect International Ship-To Province is Rome
    Then on Order Details form, expect International Ship-To Postal Code is Pisa
    Then on Order Details form, expect International Ship-To Phone is 41511111111
    Then on Order Details form, expect International Ship-To Email is autosuggest001.2@mailinator.com
    Then Sign out
