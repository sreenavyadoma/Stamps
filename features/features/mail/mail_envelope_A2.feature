Feature: Envelope a2

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_A2
  Scenario: Envelope #A2
    Then on Envelopes Print form, select Envelope - #A2, 4 ⅜” x 5 ¾”
    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address Between Zone 5 through 8
    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then on Envelopes Print form, select service First-Class Mail Letter
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "factory"
    Then in Mail Print modal, click Print button
    Then Sign out