Feature: Two character minimum for Name & Company

  Background:
    Given I am signed in to Orders

  @international_rules_engine @international_rules_engine_name_stuff
  Scenario: Two character minimum for Name & Company
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To Country to Antigua & Barbuda
    Then Set International Ship-To Name to "a"
    Then Expect Order Details International Name data error tooltip to be "A first and last name of at least two characters each is required"


    Then Order Details - Set Ship-From to default
    Then Set International Ship-To Name to "abc def"
    Then Expect Order Details International Name data error tooltip to be ""
    #Then Expect Order Details International Company data error tooltip to be ""
    #Then Set International Ship-To Name to ""
    #Then Set International Ship-To Company to "a"
    #Then Expect Order Details International Company data error tooltip to be "Company name must be at least two characters long"
    #Then Set International Ship-To Name to "a"
    #Then Set International Ship-To Company to ""
    #Then Expect Order Details International Name data error tooltip to be "A First Name and Last Name or Company are required"
    #Then Expect Order Details International Company data error tooltip to be "A First Name and Last Name or Company are required"
