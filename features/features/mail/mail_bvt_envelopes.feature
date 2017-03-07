Feature: Envelopes BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_envelopes
  Scenario: Envelope
    Then select Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then set Print form Mail-From to default
    Then set Envelope form Mail-To to a random address in zone 1
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out


