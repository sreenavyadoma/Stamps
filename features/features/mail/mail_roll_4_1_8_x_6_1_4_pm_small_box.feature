Feature: Mail Roll - 4 ⅛” x 6 ¼” - PM Small Box


  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_roll_4_1_8_x_6_1_4_pm_small_box
  Scenario: Roll - 4 ⅛” x 6 ¼” - PM Small Box

    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8


    Then set Print form Ounces to 1
    Then select Print form service PM Small Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button
    Then Sign out