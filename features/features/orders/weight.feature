
Feature: Order Details Form Negative Tests

  Background:
    Given a valid user is signed in to Web Apps

  @weight_negative_tests
  Scenario:  Weight tooltip - negative test
    Then in Orders Grid, check row 1
    Then on Order Details form, set Pounds to 71
    Then Expect Pounds tooltip to display - The maximum value for this field is 70
    Then on Order Details form, set Ounces to 16
    Then Expect Ounces tooltip to display - The maximum value for this field is 15
    Then Sign out


