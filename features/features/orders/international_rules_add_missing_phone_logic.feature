Feature: Add Missing Validation Logic for Phone and International Email

  Background:
    Given I am signed in to Orders

  @international_rules_engine @international_rules_engine_failing_tests
  Scenario: Add Missing Validation Logic for Phone and International Email
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To Country to Australia
    Then Set International Ship-To Name to ""
    Then Expect Order Details International Name data error tooltip to be "A First Name and Last Name or Company are required"
    Then Set International Ship-To Company to ""
    Then Expect Order Details International Company data error tooltip to be "A First Name and Last Name or Company are required"

    Then Set International Ship-To Name to "random"
    Then Set International Ship-To Company to "random"
    Then Set International Ship-To Address 1 to ""
    Then Expect Order Details International Address 1 data error tooltip to be "The ship to address is a required field"

    Then Set International Ship-To Address 1 to "random"
    Then Set International Ship-To City to ""
    Then Expect Order Details International City data error tooltip to be "The ship to city is a required field"

    Then Set International Ship-To City to "random"
    Then Set International Ship-To Phone to ""
    Then Expect Order Details International Phone data error tooltip to be "The ship to phone number is a required field"

    Then Set International Ship-To Phone to "random"
    Then Set International Ship-To Email to "@@"
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"
    Then Expect Order Details International Email data error tooltip to be "Please enter a valid email address"
    Then Expect Grid Ship Cost error to contain "A First Name and Last Name or Company are required"
    Then Expect Grid Ship Cost error to contain "The ship to address is a required field"
    Then Expect Grid Ship Cost error to contain "The ship to city is a required field"
    Then Expect Grid Ship Cost error to contain "The ship to phone number is a required field"
    Then Expect Grid Ship Cost error to contain "Please enter a valid email address"
    And Sign out

