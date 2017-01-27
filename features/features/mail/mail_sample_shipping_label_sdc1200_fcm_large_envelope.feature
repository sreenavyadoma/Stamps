Feature: Mail Sample Shipping Label - SDC-1200 - FCM Large Envelope



  Background:
    Given I am signed in as Mail shipper


  @mail_print_sample_shipping_label_sdc1200_fcm_large_envelope
  Scenario: Sample Shipping Label - SDC-1200 - FCM Large Envelope

    Then Mail: Select Shipping Label - SDC-1200, 4 ¼” x 6 ¾”

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 5 through 8
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select service First-Class Mail Large Envelope-Flat
    Then Mail: Open Print Sample Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button Sample
    Then Sign out