Feature: Mail Roll - 4 ⅛” x 6 ¼” - PM Box


  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_roll_4_x_6_pm_box
  Scenario: Roll - 4 ⅛” x 6 ¼” - PM Box

   #mail_print_roll_4x6_pm_large_box
    Then select Print On Roll - 4" x 6" Shipping Label

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4


    Then set Print form Ounces to 1
    Then select Print form service MM Package
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4x6_pm_medium_box
    Then select Print On Roll - 4" x 6" Shipping Label

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4


    Then set Print form Ounces to 1
    Then select Print form service PM Medium Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4x6_pm_regional_box_a
    Then select Print On Roll - 4" x 6" Shipping Label

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4


    Then set Print form Ounces to 1
    Then select Print form service PM Regional Rate Box A
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4x6_pm_regional_box_b
    Then select Print On Roll - 4" x 6" Shipping Label

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4


    Then set Print form Ounces to 1
    Then select Print form service PM Regional Rate Box B
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4x6_pm_small_box
    Then select Print On Roll - 4" x 6" Shipping Label

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4


    Then set Print form Ounces to 1
    Then select Print form service PM Small Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

    Then Sign out