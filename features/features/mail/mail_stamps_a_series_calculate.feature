Feature: Stamps A Series - Calculate Postage



  Background:
    Given I am signed in as Mail shipper

  @mail_stamps_regression
  @mail_stamps_a_series_calculate

  Scenario: Stamps Regression A Series - Calculate Postage
    Then Mail: Select Stamps
    Then Mail Stamps: Set Serial Number to A12345
    Then Mail Stamps: Select Calculate Mail Amount
    Then Mail Stamps: Set Ship-From to default
    Then Mail Stamps: Set Ship-To country to United States
    Then Mail Stamps: Select Calculate Mail Service First-Class Mail Letter
    Then Mail Stamps: Set Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print
    Then Sign out