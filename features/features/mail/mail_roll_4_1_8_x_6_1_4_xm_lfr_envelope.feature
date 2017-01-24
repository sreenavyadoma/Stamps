Feature: Mail Roll - 4 ⅛” x 6 ¼” - XM LFR Envelope


  Background:
    Given I am signed in as Mail shipper


  @mail_print_roll_4_1_8_x_6_1_4_xm_lfr_envelope
  Scenario: Roll - 4 ⅛” x 6 ¼” - XM LFR Envelope

    Then Mail: Select Roll - 4 ⅛” x 6 ¼” Shipping Label

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 5 through 8

    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Roll: Select service Priority Mail Express Legal Flat Rate Envelope
    Then Mail: Open Print Modal
    Then Mail In Print modal, select Printer "ZDesigner"
    Then Mail In Print modal, click Print button
    Then Sign out