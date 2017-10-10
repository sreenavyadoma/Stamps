
@mail_print_envelope_6_7_9_11_12
Feature: Envelope #6, #7, #9, #11, #12

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_6
  Scenario: Print On: Envelope #6

    Then select Print On Envelope - 6
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_envelope_7
  Scenario: Print On: Envelope #7

    Then select Print On Envelope - 7
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_envelope_9
  Scenario: Print On: Envelope #9

    Then select Print On Envelope - 9
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_envelope_11
  Scenario: Print On: Envelope #11

    Then select Print On Envelope - 11
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_envelope_12
  Scenario: Print On: Envelope #12

    Then select Print On Envelope - 12
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    
    Then Sign out
