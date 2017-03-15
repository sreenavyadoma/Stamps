Feature: Envelope #7

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_7
  Scenario: Envelope #7
    Then select Print On Envelope - #7, 3 ⅞" x 7 ½"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1

    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button


    Then select Print On Envelope - #9, 3 ⅞" x 8 ⅞"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1 through 4

    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then Sign out
