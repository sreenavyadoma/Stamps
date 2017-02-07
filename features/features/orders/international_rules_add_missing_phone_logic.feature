Feature: Add Missing Validation Logic for Phone and International Email

  Background:
    Given a valid user is signed in to Web Apps

  @rules_international @rules_international_dev
  Scenario: Add Missing Validation Logic for Phone and International Email
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to Australia
    Then in Orders Grid, check row 1
    Then in Orders Grid, check row 1
    Then Pause for 2 seconds
    Then in Orders Grid, check row 1

    Then on Order Details form, expect International Name data error tooltip is "A first and last name of at least two characters each is required"
    Then on Order Details form, expect International Company data error tooltip is "Company name must be at least two characters long"
    Then on Order Details form, expect International Address 1 data error tooltip is "The ship to address is a required field"
    Then on Order Details form, expect International City data error tooltip is "The ship to city is a required field"
    Then on Order Details form, expect International Phone data error tooltip is "A valid phone number is required"

    Then on Order Details form, expect service data error tooltip is "Service is required"
    Then on Order Details form, expect Weight Lbs data error tooltip is "Weight cannot be 0"
    Then on Order Details form, expect Weight Oz data error tooltip is "Weight cannot be 0"
    Then Sign out

