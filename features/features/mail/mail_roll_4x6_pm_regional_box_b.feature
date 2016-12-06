Feature: Mail Roll - 4" x 6" - PM Regional Box B



  Background:
    Given I am signed in as Mail shipper


  @mail_print_roll_4x6_pm_regional_box_b
  Scenario: Roll - 4" x 6" - PM Regional Box B


    Then Mail: Select Roll - 4” x 6” Shipping Label

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4

    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Roll: Select Service Priority Mail Regional Rate Box B
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "ZDesigner"
    Then Mail Print Modal: Print
    Then Sign out