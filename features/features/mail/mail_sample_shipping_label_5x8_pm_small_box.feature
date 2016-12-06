Feature: Mail Sample Shipping Label - 5 ½” x 8 ½” - PM Small Flat Rate Box



  Background:
    Given I am signed in as Mail shipper


  @mail_print_sample_shipping_label_5x8_pm_small_box
  Scenario: Sample Shipping Label - 5 ½” x 8 ½” - PM Small Flat Rate Box

    Then Mail: Select Shipping Label - 5 ½” x 8 ½”

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select Service Priority Mail Small Flat Rate Box
    Then Mail Shipping Labels: Select left side starting label
    Then Mail: Open Print Sample Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print Sample
    Then Sign out