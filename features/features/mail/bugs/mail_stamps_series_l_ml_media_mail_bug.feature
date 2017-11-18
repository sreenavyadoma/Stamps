
Feature: Web Client ML/L Series NetStamps | Media Mail | Unable To Get Rates

  Background:
    Given a valid user is signed in to Web Apps

  @mail_stamps_l_ml_unable_to_get_media_mail_bug
  Scenario: Web Client ML/L Series NetStamps | Media Mail | Unable To Get Rates

  @mail_stamps_l_unable_to_get_media_mail_bug
  Scenario: Stamps Regression Series #L
  #mail_print_stamps_l_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to L12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Ounces to 1
    Then expect Print form service Media Mail is not present in dropdown list
    Then select Print form service Media Mail
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_stamps_ml_unable_to_get_media_mail_bug
  Scenario: Stamps Regression Series #ML
   #mail_print_stamps_ml_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to ML1234
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Ounces to 1
    Then select Print form service Media Mail
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
