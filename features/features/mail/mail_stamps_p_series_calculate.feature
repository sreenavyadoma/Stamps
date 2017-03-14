Feature: Stamps P Series - Calculate Postage



  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_print_stamps_p_series_calculate

  Scenario: Stamps Regression P Series - Calculate Postage
    Then select Print On Stamps
    Then set Stamps Serial Number to P12345
    Then select Stamps Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then select Print form service FCM Letter
    Then set Stamps Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out