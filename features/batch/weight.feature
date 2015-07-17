@regression
Feature: Single Order Form Negative Tests

  Background:
    Given I am signed in as a batch shipper

  @weight_negative_tests
  Scenario:  Weight tooltip - negative test
    * Edit row 1 in the order grid
    * Set Pounds to 71
    * Expect Pounds tooltip to display - The maximum value for this field is 70
    * Set Ounces to 16
    * Expect Ounces tooltip to display - The maximum value for this field is 15
    * Sign out

