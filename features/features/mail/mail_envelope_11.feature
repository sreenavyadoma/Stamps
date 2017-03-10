Feature: Envelope #11

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_11
  Scenario: Envelope #11
    Then select Print On Envelope - #11, 4 ½" x 10 ⅜"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 5 through 8

    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out
