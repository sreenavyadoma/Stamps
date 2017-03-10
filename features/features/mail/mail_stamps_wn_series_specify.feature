Feature: Stamps WN Series - Specify Postage



  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_print_stamps_wn_series_specify
  Scenario: Stamps Regression WN Series - Specify Postage
    Then select Print On Stamps
    Then set Stamps Serial Number to WN1234
    Then select Stamps Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Stamps Amount to 0.15
    Then Mail Stamps: Set Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out