Feature: Envelopes BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_envelopes
  Scenario: Envelope
    Then on Envelopes Print form, select Envelope - #10, 4 ⅛” x 9 ½”
    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address in Zone 1
    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then on Envelopes Print form, select service First-Class Mail Letter
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "factory"
    Then in Mail Print modal, click Print button
    Then Sign out

  @mail_bvt_envelopes2
  Scenario: Envelope
    Then on Envelopes Print form, select Envelope - #10, 4 ⅛” x 9 ½”
    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address Between Zone 1 through 4
    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then on Envelopes Print form, set service to First-Class Mail Letter
    Then on Envelopes Print form, set Include Return Address to Checked
    Then on Envelopes Print form, set Include Delivery Address to Unchecked
   # Then on Envelopes Print form, set Include Mail to Unchecked
    Then on Envelopes Print form, set Reference Number to 43223
    Then on Envelopes Print form, set Cost Code to None
    Then in Mail Print modal, click Print button
    Then Sign out