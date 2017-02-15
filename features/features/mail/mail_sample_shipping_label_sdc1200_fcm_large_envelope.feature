Feature: Mail Sample Shipping Label - SDC-1200 - FCM Large Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_sample_shipping_label_sdc1200_fcm_large_envelope
  Scenario: Sample Shipping Label - SDC-1200 - FCM Large Envelope

    Then select Print On Shipping Label - SDC-1200 Paper on Print form

    Then set Print form Mail From to default
    Then set Print form Mail to country to United States
    Then on Print form, set Mail To address to zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print On FCM Package on Print form
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button Sample
    Then Sign out