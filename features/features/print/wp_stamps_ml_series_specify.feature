Feature: Stamps ML Series - Specify Postage



  Background:
    Given I am signed in as a postage shipper

  @wp_stamps_regression
  @wp_stamps_ml_series_specify
  Scenario: Stamps Regression ML Series - Specify Postage
    Then Postage: Select Stamps
    Then Postage Stamps: Set Serial Number to ML1234
    Then Postage Stamps: Select Specify Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Select Specify Postage Service First Class
    Then Postage Stamps: Set Stamp Amount to $0.15
    Then Postage Stamps: Set Quantity to 1
    Then Postage Stamps: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out