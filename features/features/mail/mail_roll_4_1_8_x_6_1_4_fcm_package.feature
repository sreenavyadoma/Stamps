Feature: Mail Roll - 4 ⅛” x 6 ¼” - FCM Package



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_roll_4_1_8_x_6_1_4_fcm_package
  Scenario: Roll - 4 ⅛” x 6 ¼” - FCM Package

    Then on Print form, select Roll - 4 ⅛” x 6 ¼” Shipping Label

    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address Between Zone 1 through 4

    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then Mail Roll: Select service First-Class Mail Package-Thick Envelope
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "ZDesigner"
    Then in Mail Print modal, click Print button
    Then Sign out