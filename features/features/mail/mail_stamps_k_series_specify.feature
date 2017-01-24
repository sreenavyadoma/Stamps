Feature: Stamps k Series - Specify Postage



  Background:
    Given I am signed in as Mail shipper

  @mail_print_stamps_regression
  @mail_print_stamps_k_series_specify
  Scenario: Stamps Regression K Series - Specify Postage
    Then Mail: Select Stamps
    Then Mail Stamps: Set Serial Number to K12345
    Then Mail Stamps: Select Specify Mail Amount
    Then Mail Stamps: Set Ship-From to default
    Then Mail Stamps: Set Ship-To country to United States
    Then Mail Stamps: Select Specify Mail service Media Mail
    Then Mail Stamps: Set Stamp Amount to $0.15
    Then Mail Stamps: Set Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Mail: Open Print Modal
    Then Mail In Print modal, select Printer "factory"
    Then Mail In Print modal, click Print button
    Then Sign out