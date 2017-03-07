Feature: Mail Sample Shipping Label - 5 ½” x 8 ½” - PSG Oversized Package



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_sample_shipping_label_5x8_psg_oversized_package
  Scenario: Sample Shipping Label - 5 ½” x 8 ½” - PSG Oversized Package

    Then select Print On Shipping Label - 5 ½" x 8 ½"

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Mail Service Parcel Select Ground Oversized Package
    Then on Print form, select left side starting label
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button Sample
    Then Sign out