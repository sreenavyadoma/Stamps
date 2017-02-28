Feature: Envelope #10 - Print Only Delivery Address

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_10_delivery_address
  Scenario: Envelope #10
    Then select Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 3
    Then on Envelope form, set service to First-Class Mail Letter
    Then on Envelope form, set Include Return Address to Unchecked
    Then on Envelope form, set Include Delivery Address to Checked
    Then on Envelope form, set Include Postage to Unchecked
    Then on Envelope form, set Reference Number to 12345
    Then on Envelope form, set Cost Code to None
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out
