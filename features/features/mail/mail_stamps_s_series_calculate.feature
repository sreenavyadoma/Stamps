Feature: Stamps S Series - Calculate Postage



  Background:
    Given I am signed in as Mail shipper

  @wp_stamps_regression
  @wp_stamps_s_series_calculate

  Scenario: Stamps Regression S Series - Calculate Postage
    Then Mail: Select Stamps
    Then Mail Stamps: Set Serial Number to S12345
    Then Mail Stamps: Select Calculate Mail Amount
    Then Mail Stamps: Set Ship-From to default
    Then Mail Stamps: Set Ship-To country to United States
    Then Mail Stamps: Select Calculate Mail Service First-Class Mail Postcard
    Then Mail Stamps: Set Quantity to 1
    Then Mail Stamps: Set Cost Code to None
    Then Mail: Open Print Modal
    Then Mail Print Modal: Print
    Then Sign out