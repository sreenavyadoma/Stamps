
Feature: As a batch shipper, I want to be able to use auto suggest to fill out address forms [B-01607]

  Background:
    Given I am signed in to Orders

  @auto_suggest
  Scenario: Select International Address

    Then Add New Order
    Then Order Details: Set Ship-To Country to Italy

    Then Order Details: Set International Ship-To auto-suggest address to partial name Com
    Then Order Details: Expect auto-uggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then Order Details: Expect auto-uggest pop-up entry for Firstname Venice, Lastname Florence, Company CompanyNameInternational

    Then Order Details: Select Ship-To auto-suggest item 1

    Then Order Details: Set International Ship-To auto-suggest address to partial name Flo
    Then Order Details: Select Ship-To auto-suggest item 1
    Then Order Details: Expect International Ship-To name to be Venice Florence
    Then Order Details: Expect International Ship-To company to be CompanyNameInternational
    Then Order Details: Expect International Ship-To Address 1 to be Italian Street address
    Then Order Details: Expect International Ship-To City to be ItalianCity
    Then Order Details: Expect International Ship-To Province to be Rome
    Then Order Details: Expect International Ship-To Postal Code to be Pisa
    Then Order Details: Expect International Ship-To Phone to be 41511111111
    Then Order Details: Expect International Ship-To Email to be autosuggest001.2@mailinator.com

    Then Sign out


