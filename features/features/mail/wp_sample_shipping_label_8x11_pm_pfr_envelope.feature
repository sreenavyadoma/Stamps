Feature: Postage Sample Shipping Label - 8 ½” x 11” Paper - PM Padded Flat Rate Envelope



  Background:
    Given I am signed in as a postage shipper


  @wp_shipping_label_regression
  @wp_sample_shipping_label_8x11_pm_pfr_envelope
  Scenario: Sample Shipping Label - 8 ½” x 11” Paper - PM Padded Flat Rate Envelope

    Then Postage: Select Shipping Label 8 x 11

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to Random Address Between Zone 1 through 4
    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Shipping Labels: Select Service Priority Mail Padded Flat Rate Envelope
    Then Postage Shipping Labels: Select left side starting label
    Then Postage: Open Print Sample Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print Sample
    Then Sign out