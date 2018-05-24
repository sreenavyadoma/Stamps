
Feature: Domestic Address

  Background:
    Given a valid user is signed in to Web Apps

  @auto_suggest
  Scenario: Auto Suggest for Domestic Addresses
    Then add new order
    #Matching first name
    Then set Order Details Ship-To auto-suggest address to partial name Firstname
    Then expect Order Details auto-suggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then on Order Details form, select Ship-To auto-suggest item 1
    Then expect Order Details Domestic Ship-To Name is Firstname Lastname
    Then expect Order Details Domestic Ship-To Company is CompanyNameZoneOne
    Then sign out

  @auto_suggest_international
  Scenario: Select International Address
    Then add new order
    Then set Order Details Domestic Ship-To Country to Italy
    Then set Order Details International Ship-To auto-suggest address to partial name Com
    Then expect Order Details auto-suggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then expect Order Details auto-suggest pop-up entry for Firstname Venice, Lastname Florence, Company CompanyNameInternational
    Then on Order Details form, select Ship-To auto-suggest item 1
    Then set Order Details International Ship-To auto-suggest address to partial name Flo
    Then on Order Details form, select Ship-To auto-suggest item 1
    Then expect order details ship-to name is Venice Florence
    Then expect order details international ship-to company is CompanyNameInternational
    Then expect order details international ship-to address 1 is Italian Street address
    Then expect order details international ship-to city is ItalianCity
    Then expect order details international ship-to province is Rome
    Then expect order details international ship-to postal code is Pisa
    Then expect order details ship-to phone is 41511111111
    Then expect Order Details Ship-To Email is autosuggest001.2@mailinator.com
    Then sign out
