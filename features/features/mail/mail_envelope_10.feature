Feature: Envelope #10



  Background:
    Given I am signed in as Mail shipper

  @mail_envelope_regression
  @mail_envelope_10
  Scenario: Envelope #10
    Then Mail: Select Envelope - #10
    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Envelopes: Select Service First-Class Mail Letter
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print
    Then Sign out