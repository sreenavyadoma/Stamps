Feature: International Field Validation

  Background:
    Given I am signed in as a batch shipper

  @validate_international @ray_test
  Scenario: Add Missing Validation Logic for Phone and International Email
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order Ship-To country to Australia
    Then Set International Ship-To name to ""
    Then Expect single-order form International Name data error tooltip to be "A First Name and Last Name or Company are required"
    Then Set International Ship-To company to ""
    Then Expect single-order form International Company data error tooltip to be "A First Name and Last Name or Company are required"
    Then Set International Ship-To address 1 to ""
    Then Expect single-order form International Address 1 data error tooltip to be "The ship to address is a required field"
    Then Set International Ship-To city to ""
    Then Expect single-order form International City data error tooltip to be "The ship to city is a required field"
    Then Set International Ship-To phone to ""
    Then Expect single-order form International Phone data error tooltip to be "The ship to phone number is a required field"
    Then Set International Ship-To email to "@@"
    Then Set single-order form Service to "First-Class Mail International Large Envelope/Flat"
    Then Expect single-order form International Email data error tooltip to be "Please enter a valid email address"
    Then Expect order-grid Ship Cost error to contain "A First Name and Last Name or Company are required"
    Then Expect order-grid Ship Cost error to contain "The ship to address is a required field"
    Then Expect order-grid Ship Cost error to contain "The ship to city is a required field"
    Then Expect order-grid Ship Cost error to contain "The ship to phone number is a required field"
    Then Expect order-grid Ship Cost error to contain "Please enter a valid email address"

    And Sign out