Feature: Add Missing Validation Logic for Phone and International Email

  Background:
    Given I am signed in to Orders

  @international_rules_engine
  Scenario: Add Missing Validation Logic for Phone and International Email
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to Australia
    Then UnOrders Grid: Check row 1
    Then UnOrders Grid: Check row 1
    Then Pause for 2 seconds
    Then Orders Grid: Check row 1

    Then Order Details: Expect International Name data error tooltip to be "A first and last name of at least two characters each is required"
    Then Order Details: Expect International Company data error tooltip to be "Company name must be at least two characters long"
    Then Order Details: Expect International Address 1 data error tooltip to be "The ship to address is a required field"
    Then Order Details: Expect International City data error tooltip to be "The ship to city is a required field"
    Then Order Details: Expect International Phone data error tooltip to be "A valid phone number is required"

    Then Order Details: Expect Weight Lbs data error tooltip to be "Weight cannot be 0"
    Then Order Details: Expect Weight Oz data error tooltip to be "Weight cannot be 0"
    Then Order Details: Expect Service data error tooltip to be "Service is required"

    And Sign out

