Feature: Add Missing Validation Logic for Phone and International Email

  Background:
    Given a valid user is signed in to Web Apps

  @rules_international @rules_international_dev
  Scenario: Add Missing Validation Logic for Phone and International Email
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to Australia
    Then check Orders Grid row 1

    Then expect Order Details form International Name data error tooltip is "A first and last name of at least two characters each is required"
    Then expect Order Details form International Company data error tooltip is "Company name must be at least two characters long"
    Then expect Order Details form International Address 1 data error tooltip is "The ship to address is a required field"
    Then expect Order Details form International City data error tooltip is "The ship to city is a required field"
    Then expect Order Details form International Phone data error tooltip is "A valid phone number is required"

    Then expect Order Details form service data error tooltip is "Service is required"
    Then expect Order Details form Weight Lbs data error tooltip is "Weight cannot be 0"
    Then expect Order Details form Weight Oz data error tooltip is "Weight cannot be 0"
    Then Sign out

