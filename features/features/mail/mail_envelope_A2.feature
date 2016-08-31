Feature: Envelope a2

  Background:
    Given I am signed in as a postage shipper

  @wp_envelope_regression
  @wp_envelope_A2
  Scenario: Envelope #A2
    Then Mail: Select Envelope - #A2
    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 5 through 8
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Envelopes: Select Service First-Class Mail Letter
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print
    Then Sign out