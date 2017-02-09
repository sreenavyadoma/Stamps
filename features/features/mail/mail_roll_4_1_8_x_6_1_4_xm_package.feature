Feature: Mail Roll - 4 ⅛” x 6 ¼” - XM Package


  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_roll_4_1_8_x_6_1_4_xm_package
  Scenario: Roll - 4 ⅛” x 6 ¼” - XM Package

    Then on Print form, select Roll - 4 ⅛” x 6 ¼” Shipping Label

    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address Between Zone 5 through 8

    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then Mail Roll: Select service Priority Mail Express Package
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "ZDesigner"
    Then in Mail Print modal, click Print button
    Then Sign out