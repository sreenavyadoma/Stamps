Feature: Print form k Series - Specify Postage



  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_print_stamps_k_series_specify
  Scenario: Print form Regression K Series - Specify Postage
    Then select Print On Stamps
    Then set Print form Serial Number to K12345
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