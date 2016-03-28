
Feature: Order Details Form Negative Tests

  Background:
    Given I am signed in to Orders

  @weight_negative_tests
  Scenario:  Weight tooltip - negative test
    Then Grid: Check row 1
    Then Details: Set Pounds to 71
    Then Expect Pounds tooltip to display - The maximum value for this field is 70
    Then Details: Set Ounces to 16
    Then Expect Ounces tooltip to display - The maximum value for this field is 15
    Then Sign out


