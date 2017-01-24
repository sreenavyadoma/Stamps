Feature: Stamps B Series - Calculate Postage



  Background:
    Given I am signed in as Mail shipper

  @mail_print_stamps_regression
  @mail_print_stamps_b_series_calculate

  Scenario: Stamps Regression B Series - Calculate Postage
    Then Mail: Select Stamps
    Then Mail Stamps: Set Serial Number to B12345
    Then Mail Stamps: Select Calculate Mail Amount
    Then Mail Stamps: Set Ship-From to default
    Then Mail Stamps: Set Ship-To country to United States
    Then Mail Stamps: Select Calculate Mail service First-Class Mail Large Envelope-Flat
    Then Mail Stamps: Set Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Mail: Open Print Modal
    Then Mail In Print modal, select Printer "factory"
    Then Mail In Print modal, click Print button
    Then Sign out