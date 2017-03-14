Feature: Mail Roll - 4 ⅛” x 6 ¼”

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_roll_4_1_8_x_6_1_4
  Scenario: Roll - 4 ⅛” x 6 ¼”

    #mail_print_roll_4_1_8_x_6_1_4_fcm_large_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service First-Class Mail Large Envelope-Flat
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_fcm_package
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service First-Class Mail Package-Thick Envelope
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_mm_package
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Media Mail Package
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_fr_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Flat Rate Envelope
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_large_box
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Large Flat Rate Box
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_large_box
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Large Flat Rate Box
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_large_package
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Large Package
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_lfr_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Legal Flat Rate Envelope
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_medium_box
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Medium Flat Rate Box
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_package
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Package
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_pfr_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Padded Flat Rate Envelope
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_regional_box_a
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Regional Rate Box A
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_regional_box_b
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Regional Rate Box B
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_pm_small_box
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Small Flat Rate Box
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_psg_large_package
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Parcel Select Ground Large Package
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_psg_oversized_package
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Parcel Select Ground Oversized Package
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_psg_package
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Parcel Select Ground Package
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_xm_fr_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Express Flat Rate Envelope
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_xm_lfr_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Express Legal Flat Rate Envelope
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_xm_package
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Express Package
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

   #mail_print_roll_4_1_8_x_6_1_4_xm_pfr_envelope
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Express Padded Flat Rate Envelope
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button

    Then Sign out