Feature: Two character minimum for Name & Company

  Background:
    Given I am signed in to Orders

  @rules_international @rules_international_name_stuff
  Scenario: Two character minimum for Name & Company
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to Antigua & Barbuda
    Then Order Details: Set International Ship-To Name to "a"
    Then Order Details: Expect International Name data error tooltip is "A first and last name of at least two characters each is required"


    Then Order Details: Set Ship-From to default
    Then Order Details: Set International Ship-To Name to "abc def"
    Then Order Details: Expect International Name data error tooltip is ""
    #Then Order Details: Expect International Company data error tooltip is ""
    #Then Order Details: Set International Ship-To Name to ""
    #Then Order Details: Set International Ship-To Company to "a"
    #Then Order Details: Expect International Company data error tooltip is "Company name must be at least two characters long"
    #Then Order Details: Set International Ship-To Name to "a"
    #Then Order Details: Set International Ship-To Company to ""
    #Then Order Details: Expect International Name data error tooltip is "A First Name and Last Name or Company are required"
    #Then Order Details: Expect International Company data error tooltip is "A First Name and Last Name or Company are required"
