Feature: Mail Sample Shipping Label - 5 ½” x 8 ½” - PM Regional Rate Box A



  Background:
    Given I am signed in as Mail shipper


  @wp_shipping_label_regression
  @wp_sample_shipping_label_5x8_pm_regional_box_a
  Scenario: Sample Shipping Label - 5 ½” x 8 ½” - PM Regional Rate Box A

    Then Mail: Select Shipping Label 5 x 8

    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select Service Priority Mail Regional Rate Box A
    Then Mail Shipping Labels: Select left side starting label
    Then Mail: Open Print Sample Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print Sample
    Then Sign out