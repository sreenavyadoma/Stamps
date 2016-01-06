Feature: Add Missing Validation Logic for Phone and International Email

  Background:
    Given I am signed in to Orders

  @international_rules_engine @international_rules_engine_failing_tests
  Scenario: Add Missing Validation Logic for Phone and International Email
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To Country to Australia
    Then Uncheck row 1 on the Orders Grid
    Then Wait in seconds 2
    Then Check row 1 on the Orders Grid

    Then Expect Order Details International Name data error tooltip to be "A first and last name of at least two characters each is required"
    Then Expect Order Details International Company data error tooltip to be "Company name must be at least two characters long"
    Then Expect Order Details International Address 1 data error tooltip to be "The ship to address is a required field"
    Then Expect Order Details International City data error tooltip to be "The ship to city is a required field"
    Then Expect Order Details International Phone data error tooltip to be "A valid phone number is required"

    Then Expect Order Details Weight Lbs data error tooltip to be "Weight cannot be 0"
    Then Expect Order Details Weight Oz data error tooltip to be "Weight cannot be 0"
    Then Expect Order Details Service data error tooltip to be "Service is required"

    And Sign out

