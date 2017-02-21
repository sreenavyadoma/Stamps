Feature: Stamps S Series - Calculate Postage



  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_print_stamps_s_series_calculate

  Scenario: Stamps Regression S Series - Calculate Postage
    Then select Print On Stamps
    Then Mail Stamps: Set Serial Number to S12345
    Then Mail Stamps: Select Calculate Mail Amount
    Then Mail Stamps: Set Ship-From to default
    Then Mail Stamps: Set Ship-To country to United States
    Then Mail Stamps: Select Calculate Mail service First-Class Mail Postcard
    Then Mail Stamps: Set Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then click Print form Print button
    Then click Mail Print modal Print button
    Then Sign out