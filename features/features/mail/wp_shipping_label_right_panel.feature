Feature: Extra Services BVT

  Background:
    Given I am signed in as a postage shipper

  @wp_shipping_label_right_panel
  Scenario: Shipping Label Right Panel

    Then Postage: Select Shipping Label 5 x 8

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to Random Address Between Zone 1 through 4
    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Shipping Labels: Set Service to Priority Mail Package
    Then Postage Shipping Labels: Set Hide Postage Value to Unchecked
    Then Postage Shipping Labels: Set Print Receipt to Checked
    Then Postage Shipping Labels: Set Print Reference Number to Checked
    Then Postage Shipping Labels: Set Reference Number to 12345
    Then Postage Shipping Labels: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out
