Feature: Stamps ML Series - Calculate Postage



  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_print_stamps_ml_series_calculate

  Scenario: Stamps Regression Ml Series - Calculate Postage
    Then select Print On Stamps
    Then set Stamps Serial Number to ML1234
    Then Mail Stamps: Select Calculate Mail Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then Mail Stamps: Select Calculate Mail service First-Class Mail Postcard
    Then Mail Stamps: Set Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out