
@mail_print_roll_4_1_8_x_6_1_4_mm_xm
Feature: Mail Roll - 4 ⅛” x 6 ¼” - MM_XM

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_roll_4_1_8_x_6_1_4_mm
  Scenario: Print On: Roll - 4 ⅛” x 6 ¼” - MM

    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service MM Package
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

  @mail_print_roll_4_1_8_x_6_1_4_xm_envelope
  Scenario: Print On: Roll - 4 ⅛” x 6 ¼” - XM Envelope

   #mail_print_roll_4_1_8_x_6_1_4_xm_fr_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PME Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_xm_lfr_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PME Legal Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

    #mail_print_roll_4_1_8_x_6_1_4_xm_pfr_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PME Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

  @mail_print_roll_4_1_8_x_6_1_4_xm_package
  Scenario: Print On: Roll - 4 ⅛” x 6 ¼” - XM Package

    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PME Package
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

    Then Sign out