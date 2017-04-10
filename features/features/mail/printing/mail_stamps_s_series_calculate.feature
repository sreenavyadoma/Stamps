Feature: Print form S Series - Calculate Postage



  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_print_stamps_s_series_calculate

  Scenario: Print form Regression S Series - Calculate Postage
    Then select Print On Stamps
    Then set Print form Serial Number to S12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to El Segundo
    Then set Print form Mail-To Country to United States
    Then Mail Stamps: Select Calculate Mail service First-Class Mail Postcard
    Then set Print form Quantity to 1
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then click Mail Print modal Print button
    Then Sign out