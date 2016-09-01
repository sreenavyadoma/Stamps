Feature: Mail Roll - 4" x 6" - XM FR Envelope



  Background:
    Given I am signed in as Mail shipper


  @wp_roll_regression
  @wp_roll_4x6_xm_fr_envelope
  Scenario: Roll - 4" x 6" - XM FR Envelope


    Then Mail: Select Roll 4 x 6

    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 5 through 8

    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Roll: Select Service Priority Mail Express Flat Rate Envelope
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "ZDesigner"
    Then Mail Print Modal: Print
    Then Sign out