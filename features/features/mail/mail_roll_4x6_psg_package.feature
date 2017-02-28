Feature: Mail Roll - 4" x 6" - PSG Package



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_roll_4x6_psg_package
  Scenario: Roll - 4" x 6" - PSG Package


    Then select Print On Roll - 4" x 6" Shipping Label

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8

    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Parcel Select Ground Package
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button
    Then Sign out