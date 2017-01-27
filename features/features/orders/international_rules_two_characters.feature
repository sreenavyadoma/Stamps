Feature: Two character minimum for Name & Company

  Background:
    Given a valid user is signed in to Web Apps

  @rules_international @rules_international_name_stuff
  Scenario: Two character minimum for Name & Company
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to Antigua & Barbuda
    Then on Order Details form, set International Ship-To Name to "a"
    Then on Order Details form, expect International Name data error tooltip is "A first and last name of at least two characters each is required"


    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set International Ship-To Name to "abc def"
    Then on Order Details form, expect International Name data error tooltip is ""
    #Then on Order Details form, expect International Company data error tooltip is ""
    #Then on Order Details form, set International Ship-To Name to ""
    #Then on Order Details form, set International Ship-To Company to "a"
    #Then on Order Details form, expect International Company data error tooltip is "Company name must be at least two characters long"
    #Then on Order Details form, set International Ship-To Name to "a"
    #Then on Order Details form, set International Ship-To Company to ""
    #Then on Order Details form, expect International Name data error tooltip is "A First Name and Last Name or Company are required"
    #Then on Order Details form, expect International Company data error tooltip is "A First Name and Last Name or Company are required"
