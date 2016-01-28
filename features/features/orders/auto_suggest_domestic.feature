
Feature: Domestic Address

  Background:
    Given I am signed in to Orders

  @auto_suggest
  Scenario: Auto Suggest for Domestic Addresses

    Then Add New Order

    #Matching first name
    Then Order Details: Set Ship-To auto-suggest address for partial name Thousand
    Then Order Details: Expect Auto Suggest Entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then Order Details: Select Ship-To auto-suggest item 1
    Then Order Details: Expect Ship-To Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne

    Then Sign out
