
Feature: Order Details Form Negative Tests

  Background:
    Given a valid user is signed in to Web Apps

  @weight_negative_tests
  Scenario:  Weight tooltip - negative test
    Then check row 1
    Then set order details pounds to 71
    Then Expect Pounds tooltip to display - The maximum value for this field is 70
    Then set order details ounces to 16
    Then Expect Ounces tooltip to display - The maximum value for this field is 15
    Then sign out


