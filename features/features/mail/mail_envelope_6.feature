Feature: Envelope #6

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_6
  Scenario: Envelope #6
    Then select Print On Envelope - #6, 3 ⅝" x 6 ½"
    Then set Print form Mail-From to default
    Then set Envelope form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out
