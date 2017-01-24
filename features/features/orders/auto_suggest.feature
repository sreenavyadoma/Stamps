
Feature: Domestic Address

  Background:
    Given A user is signed in to Orders

  @auto_suggest
  Scenario: Auto Suggest for Domestic Addresses
    Then In Orders Toolbar, click Add button
    #Matching first name
    Then On Order Details form, set Ship-To auto-suggest address to partial name Firstname
    Then On Order Details form, expect auto-suggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then On Order Details form, select Ship-To auto-suggest item 1
    Then On Order Details form, expect Domestic Ship-To Name is Firstname Lastname
    Then On Order Details form, expect Domestic Ship-To Company is CompanyNameZoneOne
    Then Sign out

  @auto_suggest_international
  Scenario: Select International Address
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-To Country to Italy
    Then On Order Details form, set International Ship-To auto-suggest address to partial name Com
    Then On Order Details form, expect auto-suggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then On Order Details form, expect auto-suggest pop-up entry for Firstname Venice, Lastname Florence, Company CompanyNameInternational
    Then On Order Details form, select Ship-To auto-suggest item 1
    Then On Order Details form, set International Ship-To auto-suggest address to partial name Flo
    Then On Order Details form, select Ship-To auto-suggest item 1
    Then On Order Details form, expect International Ship-To Name is Venice Florence
    Then On Order Details form, expect International Ship-To Company is CompanyNameInternational
    Then On Order Details form, expect International Ship-To Address 1 is Italian Street address
    Then On Order Details form, expect International Ship-To City is ItalianCity
    Then On Order Details form, expect International Ship-To Province is Rome
    Then On Order Details form, expect International Ship-To Postal Code is Pisa
    Then On Order Details form, expect International Ship-To Phone is 41511111111
    Then On Order Details form, expect International Ship-To Email is autosuggest001.2@mailinator.com
    Then Sign out
