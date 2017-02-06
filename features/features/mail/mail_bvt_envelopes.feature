Feature: Envelopes BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_envelopes
  Scenario: Envelope
    Then Mail: Select Envelope - #10, 4 ⅛” x 9 ½”
    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address in Zone 1
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Envelopes: Select service First-Class Mail Letter
    Then Mail: Open Print Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button
    Then Sign out

  @mail_bvt_envelopes2
  Scenario: Envelope
    Then Mail: Select Envelope - #10, 4 ⅛” x 9 ½”
    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Envelopes: Set service to First-Class Mail Letter
    Then Mail Envelopes: Set Include Return Address to Checked
    Then Mail Envelopes: Set Include Delivery Address to Unchecked
   # Then Mail Envelopes: Set Include Mail to Unchecked
    Then Mail Envelopes: Set Reference Number to 43223
    Then Mail Envelopes: Set Cost Code to None
    Then Mail in Print modal, click Print button
    Then Sign out