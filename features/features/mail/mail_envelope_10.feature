Feature: Envelope #10



  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_10
  Scenario: Envelope #10
    Then select Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then set Print form Mail From to default
    Then on Envelope form, set Mail To country to United States
    Then on Print form, set Mail To address to zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then on Envelope form, set service to First-Class Mail Letter
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out