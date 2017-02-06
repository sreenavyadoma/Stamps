Feature: Mail Roll - 4" x 6" - MM Package



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_roll_4x6_mm_package
  Scenario: Roll - 4" x 6" - MM Package


    Then Mail: Select Roll - 4” x 6” Shipping Label

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4

    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Roll: Select service Media Mail Package
    Then Mail: Open Print Modal
    Then Mail in Print modal, select Printer "ZDesigner"
    Then Mail in Print modal, click Print button
    Then Sign out