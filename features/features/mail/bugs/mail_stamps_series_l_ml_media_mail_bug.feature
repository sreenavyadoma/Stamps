
@mail_stamps_l_ml_unable_to_get_media_mail_bug
Feature: ORDERSAUTO-3348 Web Client ML/L Series NetStamps | Media Mail | Unable To Get Rates

  Background:
    Given a valid user is signed in to Web Apps

  @mail_stamps_l_unable_to_get_media_mail_bug
  Scenario: Web Client L Series NetStamps | Media Mail | Unable To Get Rates


  #mail_print_stamps_l_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to L12345
    Then select Advanced Options Calculate Postage Amount
    Then expect Print form service Media Mail is not present in dropdown list


  @mail_stamps_ml_unable_to_get_media_mail_bug
  Scenario: Web Client ML Series NetStamps | Media Mail | Unable To Get Rates

   #mail_print_stamps_ml_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to ML1234
    Then select Advanced Options Calculate Postage Amount
    Then expect Print form service Media Mail is not present in dropdown list


