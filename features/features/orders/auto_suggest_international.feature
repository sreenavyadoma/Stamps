
Feature: International Address

  Background:
    Given I am signed in to Orders

  @auto_suggest
  Scenario: Select International Address

    Then Add New Order
    Then Details: Set Ship-To Country to Italy

    Then Details: Set International Ship-To auto-suggest address to partial name Com
    Then Details: Expect auto-uggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then Details: Expect auto-uggest pop-up entry for Firstname Venice, Lastname Florence, Company CompanyNameInternational

    Then Details: Select Ship-To auto-suggest item 1

    Then Details: Set International Ship-To auto-suggest address to partial name Flo
    Then Details: Select Ship-To auto-suggest item 1
    Then Details: Expect International Ship-To Name to be Venice Florence
    Then Details: Expect International Ship-To Company to be CompanyNameInternational
    Then Details: Expect International Ship-To Address 1 to be Italian Street address
    Then Details: Expect International Ship-To City to be ItalianCity
    Then Details: Expect International Ship-To Province to be Rome
    Then Details: Expect International Ship-To Postal Code to be Pisa
    Then Details: Expect International Ship-To Phone to be 41511111111
    Then Details: Expect International Ship-To Email to be autosuggest001.2@mailinator.com

    Then Sign out
