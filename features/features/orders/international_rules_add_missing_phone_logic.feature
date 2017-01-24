Feature: Add Missing Validation Logic for Phone and International Email

  Background:
    Given A user is signed in to Orders

  @rules_international @rules_international_dev
  Scenario: Add Missing Validation Logic for Phone and International Email
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to Australia
    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 1
    Then Pause for 2 seconds
    Then In Orders Grid, check row 1

    Then On Order Details form, expect International Name data error tooltip is "A first and last name of at least two characters each is required"
    Then On Order Details form, expect International Company data error tooltip is "Company name must be at least two characters long"
    Then On Order Details form, expect International Address 1 data error tooltip is "The ship to address is a required field"
    Then On Order Details form, expect International City data error tooltip is "The ship to city is a required field"
    Then On Order Details form, expect International Phone data error tooltip is "A valid phone number is required"

    Then On Order Details form, expect service data error tooltip is "Service is required"
    Then On Order Details form, expect Weight Lbs data error tooltip is "Weight cannot be 0"
    Then On Order Details form, expect Weight Oz data error tooltip is "Weight cannot be 0"
    Then Sign out

