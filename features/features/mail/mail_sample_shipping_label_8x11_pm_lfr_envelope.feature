Feature: Mail Sample Shipping Label - 8 ½” x 11” Paper - PM Legal Flat Rate Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_sample_shipping_label_8x11_pm_lfr_envelope
  Scenario: Sample Shipping Label - 8 ½” x 11” Paper - PM Legal Flat Rate Envelope

    Then select Print On Shipping Label - 8 ½" x 11" Paper

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8

    Then set Print form Ounces to 1
    Then select Print form service Priority Mail Legal Flat Rate Envelope
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Print button on Mail Print modal Sample
    Then Sign out