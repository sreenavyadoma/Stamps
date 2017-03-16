Feature: Mail Sample Shipping Label - 8 ½” x 11” Paper - PSG Large Package



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_sample_shipping_label_8x11_psg_large_package
  Scenario: Sample Shipping Label - 8 ½” x 11” Paper - PSG Large Package

    Then select Print On Shipping Label - 8 ½" x 11" Paper

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4

    Then set Print form Ounces to 1
    Then select Print form service Parcel Select Ground Large Package
    Then on Print form, select left side starting label
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Print button on Mail Print modal Sample
    Then Sign out