Feature: Stamps Series #A, #B, #C, #K, #L, #ML

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_stamps_series_a_b_c_k_l_ml
  Scenario: Stamps Regression Series #A, #B, #C, #K, #L, #ML

   #mail_print_stamps_a_series_calculate
    Then select Print On Stamps
    Then set Stamps Serial Number to A12345
    Then select Stamps Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then select Print form service FCM Letter
    Then set Stamps Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_stamps_a_series_specify
    Then select Print On Stamps
    Then set Stamps Serial Number to A12345
    Then select Stamps Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then Mail Stamps: Select Specify Mail service First Class
    Then set Stamps Amount to 0.15
    Then set Stamps Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_stamps_b_series_calculate
    Then select Print On Stamps
    Then set Stamps Serial Number to B12345
    Then select Stamps Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then Mail Stamps: Select Calculate Mail service First-Class Mail Large Envelope-Flat
    Then set Stamps Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_stamps_b_series_specify
    Then select Print On Stamps
    Then set Stamps Serial Number to B12345
    Then select Stamps Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Stamps Amount to 0.15
    Then set Stamps Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_stamps_c_series_calculate
    Then select Print On Stamps
    Then set Stamps Serial Number to C12345
    Then select Stamps Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then Mail Stamps: Select Calculate Mail service First-Class Mail Postcard
    Then set Stamps Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_stamps_c_series_specify
    Then select Print On Stamps
    Then set Stamps Serial Number to C12345
    Then select Stamps Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then Mail Stamps: Select Specify Mail service First Class
    Then set Stamps Amount to 0.15
    Then set Stamps Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_stamps_k_series_calculate
    Then select Print On Stamps
    Then set Stamps Serial Number to K12345
    Then select Stamps Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then select Print form service FCM Letter
    Then set Stamps Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_stamps_k_series_specify
    Then select Print On Stamps
    Then set Stamps Serial Number to K12345
    Then select Stamps Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Stamps Amount to 0.15
    Then set Stamps Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_stamps_l_series_calculate
    Then select Print On Stamps
    Then set Stamps Serial Number to L12345
    Then select Stamps Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then Mail Stamps: Select Calculate Mail service First-Class Mail Large Envelope-Flat
    Then set Stamps Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_stamps_l_series_specify
    Then select Print On Stamps
    Then set Stamps Serial Number to L12345
    Then select Stamps Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then Mail Stamps: Select Specify Mail service First Class
    Then set Stamps Amount to 0.15
    Then set Stamps Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_stamps_ml_series_calculate
    Then select Print On Stamps
    Then set Stamps Serial Number to ML1234
    Then select Stamps Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then Mail Stamps: Select Calculate Mail service First-Class Mail Postcard
    Then set Stamps Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_stamps_ml_series_specify
    Then select Print On Stamps
    Then set Stamps Serial Number to ML1234
    Then select Stamps Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then Mail Stamps: Select Specify Mail service First Class
    Then set Stamps Amount to 0.15
    Then set Stamps Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then Sign out