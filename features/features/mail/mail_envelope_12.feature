Feature: Envelopes #12

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_12
  Scenario: Envelope #12
    Then on Print form, select Envelope - #12”
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