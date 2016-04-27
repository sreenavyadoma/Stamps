Feature: Postage Roll - 4" x 6" - PSG Oversized Package



  Background:
    Given I am signed in as a postage shipper


  @wp_roll_regression
  @wp_roll_4x6_psg_oversized_package
  Scenario: Roll - 4" x 6" - PSG Oversized Package


    Then Postage: Select Roll 4 x 6

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to Random Address Between Zone 5 through 8

    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Roll: Select Service Parcel Select Ground Oversized Package
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "ZDesigner"
    Then Postage Print Modal: Print
    Then Sign out