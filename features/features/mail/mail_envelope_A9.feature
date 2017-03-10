Feature: Envelope #A9

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_A9
  Scenario: Envelope #A9
    Then select Print On Envelope - #A9, 5 ¾" x 8 ¾"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 5 through 8

    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out