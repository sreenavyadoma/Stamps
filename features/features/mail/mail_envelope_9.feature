Feature: Envelope #9

  Background:
    Given I am signed in as Mail shipper

  @mail_print_envelope_9
  Scenario: Envelope #9
    Then Mail: Select Envelope - #9, 3 ⅞” x 8 ⅞”
    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Envelopes: Select service First-Class Mail Letter
    Then Mail: Open Print Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button
    Then Sign out