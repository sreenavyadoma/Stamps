Feature: Envelope #A9

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_A9
  Scenario: Envelope #A9
    Then select Print On Envelope - #A9, 5 ¾" x 8 ¾"
    Then set Print form Mail From to default
    Then set Print form Mail to country to United States
    Then on Print form, set Mail To address to zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then on Envelope form, set service to First-Class Mail Letter
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out