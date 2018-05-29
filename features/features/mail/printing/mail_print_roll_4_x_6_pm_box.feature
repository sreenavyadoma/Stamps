
@mail_print_roll_4_x_6_pm_box
Feature: Mail Roll - 4 ⅛” x 6 ¼” - PM Box

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_roll_4_x_6_pm_box_size
  Scenario: Roll - 4 ⅛” x 6 ¼” - PM Box Size

   #mail_print_roll_4x6_pm_large_box
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Large Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4x6_pm_medium_box
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Medium Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

    #mail_print_roll_4x6_pm_small_box
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Small Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

  @mail_print_roll_4_x_6_pm_regional_box
  Scenario: Roll - 4 ⅛” x 6 ¼” - PM Regional Box

   #mail_print_roll_4x6_pm_regional_box_a
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Regional Rate Box A
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4x6_pm_regional_box_b
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Regional Rate Box B
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

    Then sign out