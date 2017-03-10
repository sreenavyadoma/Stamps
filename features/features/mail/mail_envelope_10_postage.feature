Feature: Envelope #10 - Print Only Postage

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_10_postage
  Scenario: Envelope #10
    Then select Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1 through 4

    Then set Print form Ounces to 3.5
    Then select Print form service FCM Letter
    Then on Envelope form, set Include Return Address to Unchecked
    Then on Envelope form, set Include Delivery Address to Unchecked
    Then on Envelope form, set Include Postage to Checked
    Then on Envelope form, set Reference Number to 54321
    Then on Envelope form, set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out
