Feature: Extra Services BVT

  Background:
    Given I am signed in as a postage shipper

  @wp_shipping_label_right_panel
  Scenario: Shipping Label Right Panel

    Then Mail: Select Shipping Label 5 x 8

    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Set Service to Priority Mail Package
    Then Mail Shipping Labels: Set Hide Mail Value to Unchecked
    Then Mail Shipping Labels: Set Print Receipt to Checked
    Then Mail Shipping Labels: Set Print Reference Number to Checked
    Then Mail Shipping Labels: Set Reference Number to 12345
    Then Mail Shipping Labels: Set Cost Code to None
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print
    Then Sign out
