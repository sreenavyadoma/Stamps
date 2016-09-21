Feature: Mail Roll - 4 ⅛” x 6 ¼” - PM Regional Box B


  Background:
    Given I am signed in as Mail shipper


  @wp_roll_regression
  @wp_roll_4_1_8_x_6_1_4_pm_regional_box_b
  Scenario: Roll - 4 ⅛” x 6 ¼” - PM Regional Box B

    Then Mail: Select Roll 4 ⅛ x 6 ¼

    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 5 through 8

    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Roll: Select Service Priority Mail Regional Rate Box B
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "ZDesigner"
    Then Mail Print Modal: Print
    Then Sign out