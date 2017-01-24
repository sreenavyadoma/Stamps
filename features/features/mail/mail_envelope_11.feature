Feature: Envelope #11

  Background:
    Given I am signed in as Mail shipper

  @mail_print_envelope_11
  Scenario: Envelope #11
    Then Mail: Select Envelope - #11, 4 ½” x 10 ⅜”
    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 5 through 8
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Envelopes: Select service First-Class Mail Letter
    Then Mail: Open Print Modal
    Then Mail In Print modal, select Printer "factory"
    Then Mail In Print modal, click Print button
    Then Sign out
