Feature: Envelope #10 - Print Only Return Address

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_10_return_address
  Scenario: Envelope #10
    Then on Envelopes Print form, select Envelope - #10, 4 ⅛” x 9 ½”
    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address Between Zone 1 through 4
    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 2
    Then on Envelopes Print form, set service to First-Class Mail Letter
    Then on Envelopes Print form, set Include Return Address to Checked
    Then on Envelopes Print form, set Include Delivery Address to Unchecked
    Then on Envelopes Print form, set Include Postage to Unchecked
    Then on Envelopes Print form, set Reference Number to 12345
    Then on Envelopes Print form, set Cost Code to None
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "factory"
    Then in Mail Print modal, click Print button
    Then Sign out
