Feature: Mail Roll - 4 ⅛” x 6 ¼” - PSG Oversized Package


  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_roll_4_1_8_x_6_1_4_psg_oversized_package
  Scenario: Roll - 4 ⅛” x 6 ¼” - PSG Oversized Package

    Then on Print form, select Roll - 4 ⅛” x 6 ¼” Shipping Label

    Then set Print form Mail From to default
    Then set Print form Mail to country to United States
    Then on Print form, set Mail To address to zone 5 through 8

    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Parcel Select Ground Oversized Package
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Print button on Mail Print modal
    Then Sign out