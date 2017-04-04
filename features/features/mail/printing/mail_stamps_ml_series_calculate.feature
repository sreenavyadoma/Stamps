Feature: Print form ML Series - Calculate Postage



  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_print_stamps_ml_series_calculate

  Scenario: Print form Regression Ml Series - Calculate Postage
    Then select Print On Stamps
    Then set Print form Serial Number to ML1234
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form ounces to 1
    Then select Print form service FCM Letter
    Then set Print form Quantity to 1
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out