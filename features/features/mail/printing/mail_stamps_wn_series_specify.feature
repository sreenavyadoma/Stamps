Feature: Print form WN Series - Specify Postage



  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_print_stamps_wn_series_specify
  Scenario: Print form Regression WN Series - Specify Postage
    Then select Print On Stamps
    Then set Print form Serial Number to WN1234
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Print form Amount to 0.15
    Then set Print form Quantity to 1
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out