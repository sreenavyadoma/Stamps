Feature: Stamps S Series - Specify Postage



  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_print_stamps_s_series_specify
  Scenario: Stamps Regression S Series - Specify Postage
    Then select Print On Stamps
    Then set Stamps Serial Number to S12345
    Then select Stamps Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Stamps Amount to 0.15
    Then set Stamps Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then Sign out