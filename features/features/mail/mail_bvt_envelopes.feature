Feature: Envelopes BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_envelopes
  Scenario: Envelope
    Then select Print form Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then set Print form Mail From to default
    Then set Label form Mail To to a random address in zone 1
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out

  @mail_bvt_envelopes2
  Scenario: Envelope
    Then select Print form Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then set Print form Mail From to default
    Then on Envelope form, set Mail To country to United States
    Then on Envelope form, set Mail To address to zone 1 through 4
    Then on Envelope form, set Pounds to 0
    Then on Envelope form, set Ounces to 1
    Then on Envelope form, set service to First-Class Mail Letter
    Then on Envelope form, set Include Return Address to Checked
    Then on Envelope form, set Include Delivery Address to Unchecked
   # Then on Envelope form, set Include Mail to Unchecked
    Then on Envelope form, set Reference Number to 43223
    Then on Envelope form, set Cost Code to None
    Then click Mail Print modal Print button
    Then Sign out

