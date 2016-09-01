Feature: Mail Roll - 4" x 6" - PSG Large Package



  Background:
    Given I am signed in as Mail shipper


  @wp_roll_regression
  @wp_roll_4x6_psg_large_package
  Scenario: Roll - 4" x 6" - PSG Large Package


    Then Mail: Select Roll 4 x 6

    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4

    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Roll: Select Service Parcel Select Ground Large Package
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "ZDesigner"
    Then Mail Print Modal: Print
    Then Sign out