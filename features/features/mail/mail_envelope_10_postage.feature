Feature: Envelope #10 - Print Only Postage

  Background:
    Given I am signed in as Mail shipper

  @mail_print_envelope_10_postage
  Scenario: Envelope #10
    Then Mail: Select Envelope - #10, 4 ⅛” x 9 ½”
    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 3.5
    Then Mail Envelopes: Set service to First-Class Mail Letter
    Then Mail Envelopes: Set Include Return Address to Unchecked
    Then Mail Envelopes: Set Include Delivery Address to Unchecked
    Then Mail Envelopes: Set Include Postage to Checked
    Then Mail Envelopes: Set Reference Number to 54321
    Then Mail Envelopes: Set Cost Code to None
    Then Mail: Open Print Modal
    Then Mail In Print modal, select Printer "factory"
    Then Mail In Print modal, click Print button
    Then Sign out
