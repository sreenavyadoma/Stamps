Feature: Two character minimum for Name & Company

  Background:
    Given a valid user is signed in to Web Apps

  @rules_international @rules_international_name_stuff
  Scenario: Two character minimum for Name & Company
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo, CA
    Then set Order Details form Ship-To Country to Antigua & Barbuda
    Then set Order Details form International Ship-To Name to "a"
    Then expect Order Details form International Name data error tooltip is "A first and last name of at least two characters each is required"


    Then set Order Details form Ship-From to El Segundo, CA
    Then set Order Details form International Ship-To Name to "abc def"
    Then expect Order Details form International Name data error tooltip is ""
    #Then expect Order Details form International Company data error tooltip is ""
    #Then set Order Details form International Ship-To Name to ""
    #Then set Order Details form International Ship-To Company to "a"
    #Then expect Order Details form International Company data error tooltip is "Company name must be at least two characters long"
    #Then set Order Details form International Ship-To Name to "a"
    #Then set Order Details form International Ship-To Company to ""
    #Then expect Order Details form International Name data error tooltip is "A First Name and Last Name or Company are required"
    #Then expect Order Details form International Company data error tooltip is "A First Name and Last Name or Company are required"
