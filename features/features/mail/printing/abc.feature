Feature: Envelope #6, #7, #9, #11, #12

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_abc
  Scenario: Print On: Envelope #6

    Then select Print On1 <abc>
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then Sign out

    Examples:
    |abc|
    |Envelope - #6, 3 ⅝" x 6 ½"|
    |Envelope - #9, 3 ⅞" x 8 ⅞"|