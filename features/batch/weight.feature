@regression
Feature: Single Order Form Negative Tests

  Background:
    Given I am signed in as a batch shipper

  @weight_negative_tests
  Scenario:  Weight tooltip - negative test
    And Edit row 1 on the order grid
    Then Set Pounds to 71
    Then Expect Pounds tooltip to display - The maximum value for this field is 70
    Then Set Ounces to 16
    Then Expect Ounces tooltip to display - The maximum value for this field is 15
    And Sign out

