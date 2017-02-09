Feature: Envelope #10



  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_10
  Scenario: Envelope #10
    Then on Envelopes Print form, select Envelope - #10, 4 ⅛” x 9 ½”
    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address Between Zone 1 through 4
    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then on Envelopes Print form, select service First-Class Mail Letter
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "factory"
    Then in Mail Print modal, click Print button
    Then Sign out