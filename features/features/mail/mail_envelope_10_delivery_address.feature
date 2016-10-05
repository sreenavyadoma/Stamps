Feature: Envelope #10 - Print Only Delivery Address

  Background:
    Given I am signed in as Mail shipper

  @mail_envelope_10_delivery_address
  Scenario: Envelope #10
    Then Mail: Select Envelope - #10
    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 3
    Then Mail Envelopes: Set Service to First-Class Mail Letter
    Then Mail Envelopes: Set Include Return Address to Unchecked
    Then Mail Envelopes: Set Include Delivery Address to Checked
    Then Mail Envelopes: Set Include Postage to Unchecked
    Then Mail Envelopes: Set Reference Number to 12345
    Then Mail Envelopes: Set Cost Code to None
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print
    Then Sign out
