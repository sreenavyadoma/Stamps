Feature: Postage Roll - 4 ⅛” x 6 ¼” - XM P Envelope


  Background:
    Given I am signed in as a postage shipper


  @wp_roll_regression
  @wp_roll_4_1_8_x_6_1_4_xm_pfr_envelope
  Scenario: Roll - 4 ⅛” x 6 ¼” - XM PFR Envelope

    Then Postage: Select Roll 4 ⅛ x 6 ¼

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to Random Address Between Zone 5 through 8

    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Roll: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "ZDesigner"
    Then Postage Print Modal: Print
    Then Sign out