
Feature: As a batch shipper, I want to be able to use auto suggest to fill out address forms [B-01607]

  Background:
    Given I am signed in to Orders

  @auto_suggest_dev
  Scenario: Select Domestic Address

    Then Add New Order

    #Matching first name
    Then Order Details: Set Ship-To auto-suggest address for partial name Thousand
    Then Order Details: Expect Auto Suggest Entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then Order Details: Select Ship-To auto-suggest item 1
    Then Order Details: Expect Ship-To Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne

    Then Sign out
