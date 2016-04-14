Feature: Two character minimum for Name & Company

  Background:
    Given I am signed in to Orders

  @rules_international @rules_international_name_stuff
  Scenario: Two character minimum for Name & Company
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to Antigua & Barbuda
    Then Details: Set International Ship-To Name to "a"
    Then Details: Expect International Name data error tooltip to be "A first and last name of at least two characters each is required"


    Then Details: Set Ship-From to default
    Then Details: Set International Ship-To Name to "abc def"
    Then Details: Expect International Name data error tooltip to be ""
    #Then Details: Expect International Company data error tooltip to be ""
    #Then Details: Set International Ship-To Name to ""
    #Then Details: Set International Ship-To Company to "a"
    #Then Details: Expect International Company data error tooltip to be "Company name must be at least two characters long"
    #Then Details: Set International Ship-To Name to "a"
    #Then Details: Set International Ship-To Company to ""
    #Then Details: Expect International Name data error tooltip to be "A First Name and Last Name or Company are required"
    #Then Details: Expect International Company data error tooltip to be "A First Name and Last Name or Company are required"
