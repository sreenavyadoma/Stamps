Feature: Print form A Series - Specify Postage



  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_print_stamps_a_series_specify
  Scenario: Print form Regression A Series - Specify Postage
    Then select Print On Stamps
    Then set Print form Serial Number to A12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to El Segundo
    Then set Print form Mail-To Country to United States
    Then Mail Stamps: Select Specify Mail service First Class
    Then set Print form Amount to 0.15
    Then set Print form Quantity to 1
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out