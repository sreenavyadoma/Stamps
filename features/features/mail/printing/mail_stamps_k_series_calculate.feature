Feature: Print form K Series - Calculate Postage



  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_print_stamps_k_series_calculate

  Scenario: Print form Regression K Series - Calculate Postage
    Then select Print On Stamps
    Then set Print form Serial Number to K12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to El Segundo
    Then set Print form Mail-To Country to United States
    Then select Print form service FCM Letter
    Then set Print form Quantity to 1
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out