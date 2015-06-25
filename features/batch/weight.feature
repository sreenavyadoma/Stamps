@regression
Feature: B-01671 As a batch shipper, I want to see in-line rates as I edit an order

  Background:
    Given I am signed in as a batch shipper with credentials auto01/password1

  @weight_tooltip
  Scenario:  Weight tooltip - negative test
    * Edit row 1 in the order grid
    * Set Pounds to 71
    * Expect Pounds tooltip to display - The maximum value for this field is 70
    * Set Ounces to 16
    * Expect Ounces tooltip to display - The maximum value for this field is 15
    * Sign out

