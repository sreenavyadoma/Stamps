Feature: Stamps S Series - Specify Postage



  Background:
    Given I am signed in as a postage shipper

  @wp_stamps_regression
  @wp_stamps_s_series_specify
  Scenario: Stamps Regression S Series - Specify Postage
    Then Postage: Select Stamps
    Then Postage Stamps: Set Serial Number to S12345
    Then Postage Stamps: Select Specify Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Select Specify Postage Service Media Mail
    Then Postage Stamps: Set Stamp Amount to $0.15
    Then Postage Stamps: Set Quantity to 1
    Then Postage Stamps: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Sign out