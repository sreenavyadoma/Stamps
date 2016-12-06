Feature: Mail Roll - 4 ⅛” x 6 ¼” - FCM Large Envelope

  Background:
    Given I am signed in as Mail shipper

  @mail_print_roll_4_1_8_x_6_1_4_fcm_large_envelope
  Scenario: Roll - 4 ⅛” x 6 ¼” - FCM Large Envelope

    Then Mail: Select Roll - 4 ⅛” x 6 ¼” Shipping Label

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4

    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Roll: Select Service First-Class Mail Large Envelope-Flat
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "ZDesigner"
    Then Mail Print Modal: Print
    Then Sign out