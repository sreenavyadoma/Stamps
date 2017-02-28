Feature: Mail Shipping Label - 5 ½” x 8 ½” - FCM Large Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_5x8_fcm_large_envelope
  Scenario: Shipping Label - 5 ½” x 8 ½” - FCM Large Envelope

    Then select Print On Shipping Label - 5 ½" x 8 ½"

    Then set Print form Mail-From to default
    Then set Label form Mail-To to address to random, random, 1350 Market Street, San Francisco, CA
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print On FCM Package on Print form
    Then on Print form, select left side starting label
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out