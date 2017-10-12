
@mail_stamps_series_a_b_c_k_l_ml
Feature: Stamps Series #A, #B, #C, #K, #L, #ML

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_stamps_series_a
   Scenario: Stamps Regression Series #A
   #mail_print_stamps_a_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to A12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    #mail_print_stamps_a_series_specify
    Then select Print On Stamps
    Then set Print form Serial Number to A12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Print form Amount to 0.15
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_stamps_series_b
  Scenario: Stamps Regression Series #B
   #mail_print_stamps_b_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to B12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_stamps_b_series_specify
    Then select Print On Stamps
    Then set Print form Serial Number to B12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Print form Amount to 0.15
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_stamps_series_c
  Scenario: Stamps Regression Series #C
   #mail_print_stamps_c_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to C12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_stamps_c_series_specify
    Then select Print On Stamps
    Then set Print form Serial Number to C12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Print form Amount to 0.15
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_stamps_series_k
  Scenario: Stamps Regression Series #K
   #mail_print_stamps_k_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to K12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_stamps_k_series_specify
    Then select Print On Stamps
    Then set Print form Serial Number to K12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Print form Amount to 0.15
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_stamps_series_l
  Scenario: Stamps Regression Series #L
   #mail_print_stamps_l_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to L12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_stamps_l_series_specify
    Then select Print On Stamps
    Then set Print form Serial Number to L12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Print form Amount to 0.15
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_stamps_series_ml
  Scenario: Stamps Regression Series #ML
   #mail_print_stamps_ml_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to ML1234
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_stamps_ml_series_specify
    Then select Print On Stamps
    Then set Print form Serial Number to ML1234
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Print form Amount to 0.15
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then Sign out