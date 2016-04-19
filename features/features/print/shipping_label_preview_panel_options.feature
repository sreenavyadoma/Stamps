Feature:Shipping Label Preview Panel 



  Background:
    Given I am signed in as a postage shipper


  @wp_shipping_label_preview_panel_options
  Scenario: Shipping Label Preview Panel

    Then Postage: Select Shipping Label 5 x 8

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to Random Address Between Zone 1 through 4
    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Shipping Labels: Select Service Priority Mail Package
    Then Postage Shipping Labels: Set Hide Postage Value to Checked
    Then Postage Shipping Labels: Set Hide Postage Value to Unchecked
    Then Postage Shipping Labels: Set Print Reference Number to Checked
    Then Postage Shipping Labels: Set Print Reference Number to Unchecked
    Then Postage Shipping Labels: Set Print Receipt to Checked
    Then Postage Shipping Labels: Set Print Receipt to Unchecked
    Then Postage Shipping Labels: Set Reference Number to test12435
    Then Postage Shipping Labels: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

