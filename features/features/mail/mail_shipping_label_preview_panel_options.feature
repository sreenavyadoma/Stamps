Feature:Shipping Label Preview Panel 



  Background:
    Given I am signed in as Mail shipper


  @mail_print_shipping_label_preview_panel_options
  Scenario: Shipping Label Preview Panel

    Then Mail: Select Shipping Label - 5 ½” x 8 ½”

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select service Priority Mail Package
    Then Mail Shipping Labels: Set Hide Mail Value to Checked
    Then Mail Shipping Labels: Set Hide Mail Value to Unchecked
    Then Mail Shipping Labels: Set Print Reference Number to Checked
    Then Mail Shipping Labels: Set Print Reference Number to Unchecked
    Then Mail Shipping Labels: Set Print Receipt to Checked
    Then Mail Shipping Labels: Set Print Receipt to Unchecked
    Then Mail Shipping Labels: Set Reference Number to test12435
    Then Mail Shipping Labels: Set Cost Code to None
    Then Mail: Open Print Modal
    Then Mail In Print modal, select Printer "factory"
    Then Mail In Print modal, click Print button
    Then Sign out

