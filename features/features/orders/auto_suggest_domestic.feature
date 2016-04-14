
Feature: Domestic Address

  Background:
    Given I am signed in to Orders

  @auto_suggest
  Scenario: Auto Suggest for Domestic Addresses

    Then Toolbar: Add

    #Matching first name
    Then Details: Set Ship-To auto-suggest address to partial name Firstname
    Then Details: Expect auto-uggest pop-up entry for Firstname Firstname, Lastname Lastname, Company CompanyNameZoneOne
    Then Details: Select Ship-To auto-suggest item 1
    Then Details: Expect Domestic Ship-To Name to be Firstname Lastname
    Then Details: Expect Domestic Ship-To Company to be CompanyNameZoneOne

    Then Sign out
