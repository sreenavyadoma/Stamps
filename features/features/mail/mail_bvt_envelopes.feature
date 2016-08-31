Feature: Envelopes BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_bvt_envelopes
  Scenario: Envelope
    Then Mail: Select Envelope - #10
    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address in Zone 1
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Envelopes: Select Service First-Class Mail Letter
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print
    Then Sign out

  @wp_bvt_envelopes2
  Scenario: Envelope
    Then Mail: Select Envelope - #10
    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Envelopes: Set Service to First-Class Mail Letter
    Then Mail Envelopes: Set Include Return Address to Checked
    Then Mail Envelopes: Set Include Delivery Address to Unchecked
    Then Mail Envelopes: Set Include Mail to Unchecked
    Then Mail Envelopes: Set Reference Number to 43223
    Then Mail Envelopes: Set Cost Code to None
    Then Mail Print Modal: Print
    Then Sign out