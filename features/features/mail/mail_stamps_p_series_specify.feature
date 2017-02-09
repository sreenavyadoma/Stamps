Feature: Stamps P Series - Specify Postage



  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_stamps_regression
  @mail_print_stamps_p_series_specify
  Scenario: Stamps Regression P Series - Specify Postage
    Then on Print form, select Stamps
    Then Mail Stamps: Set Serial Number to P12345
    Then Mail Stamps: Select Specify Mail Amount
    Then Mail Stamps: Set Ship-From to default
    Then Mail Stamps: Set Ship-To country to United States
    Then Mail Stamps: Select Specify Mail service First Class
    Then Mail Stamps: Set Stamp Amount to $0.15
    Then Mail Stamps: Set Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "factory"
    Then in Mail Print modal, click Print button
    Then Sign out