Feature: Mail Roll - 4 ⅛” x 6 ¼” - FCM_PSG

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_roll_4_1_8_x_6_1_4_fcm_psg
  Scenario: Roll - 4 ⅛” x 6 ¼” - FCM_PSG

   #mail_print_roll_4_1_8_x_6_1_4_fcm_large_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_fcm_package
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Package
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_psg_large_package
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PSG Large Package
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_psg_oversized_package
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PSG Oversized Package
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_psg_package
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PSG Package
    Then Print Postage
    Then set Mail Print modal Printer to ZDesigner
    Then click Mail Print modal Print button

    Then Sign out
