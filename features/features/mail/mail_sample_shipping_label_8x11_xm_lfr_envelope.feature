Feature: Mail Sample Shipping Label - 8 ½” x 11” Paper - XM Legal Flat Rate Envelope



  Background:
    Given I am signed in as Mail shipper


  @mail_sample_shipping_label_8x11_xm_lfr_envelope
  Scenario: Sample Shipping Label - 8 ½” x 11” Paper - XM Legal Flat Rate Envelope

    Then Mail: Select Shipping Label 8 x 11

    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Mail Shipping Labels: Select left side starting label
    Then Mail: Open Print Sample Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print Sample
    Then Sign out