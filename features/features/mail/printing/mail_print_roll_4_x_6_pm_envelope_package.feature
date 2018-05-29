
@mail_print_roll_4_x_6_pm_envelope_package
Feature: Mail Roll - 4 ⅛” x 6 ¼” - PM Envelope Package

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_roll_4_x_6_pm_envelope
  Scenario: Roll - 4 ⅛” x 6 ¼” - PM Envelope

   #mail_print_roll_4x6_pm_fr_envelope
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4x6_pm_large_envelope
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Large/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

    #mail_print_roll_4x6_pm_lfr_envelope
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Legal Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

    #mail_print_roll_4x6_pm_pfr_envelope
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Padded Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

  @mail_print_roll_4_x_6_pm_package
  Scenario: Roll - 4 ⅛” x 6 ¼” - PM Package

   #mail_print_roll_4x6_pm_large_package
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Large Package
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4x6_pm_package
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Package
    Then Print Postage
    Then set Mail Print modal Printer ZDesigner
    Then click Mail Print modal Print button

    Then sign out