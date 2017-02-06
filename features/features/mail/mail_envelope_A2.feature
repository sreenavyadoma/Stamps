Feature: Envelope a2

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_A2
  Scenario: Envelope #A2
    Then Mail: Select Envelope - #A2, 4 ⅜” x 5 ¾”
    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 5 through 8
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Envelopes: Select service First-Class Mail Letter
    Then Mail: Open Print Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button
    Then Sign out