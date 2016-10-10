Feature: Add Missing Validation Logic for Phone and International Email

  Background:
    Given I am signed in to Orders

  @rules_international @rules_international_dev
  Scenario: Add Missing Validation Logic for Phone and International Email
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to Australia
    Then Grid: Check row 1
    Then Grid: Check row 1
    Then Pause for 2 seconds
    Then Grid: Check row 1

    Then Details: Expect International Name data error tooltip is "A first and last name of at least two characters each is required"
    Then Details: Expect International Company data error tooltip is "Company name must be at least two characters long"
    Then Details: Expect International Address 1 data error tooltip is "The ship to address is a required field"
    Then Details: Expect International City data error tooltip is "The ship to city is a required field"
    Then Details: Expect International Phone data error tooltip is "A valid phone number is required"

    Then Details: Expect Service data error tooltip is "Service is required"
    Then Details: Expect Weight Lbs data error tooltip is "Weight cannot be 0"
    Then Details: Expect Weight Oz data error tooltip is "Weight cannot be 0"
    Then Sign out

