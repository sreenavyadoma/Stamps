
Feature: Order Details Form Negative Tests

  Background:
    Given a valid user is signed in to Web Apps

  @weight_negative_tests
  Scenario:  Weight tooltip - negative test
    Then check Orders Grid row 1
    Then set Order Details form Pounds to 71
    Then Expect Pounds tooltip to display - The maximum value for this field is 70
    Then set Order Details form Ounces to 16
    Then Expect Ounces tooltip to display - The maximum value for this field is 15
    Then Sign out


