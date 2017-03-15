Feature: Mail Sample Shipping Label - 8 ½” x 11” MM XM Paper

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_sample_shipping_label_8x11_mm_xm
  Scenario: Sample Shipping Label - 8 ½” x 11” MM XM Paper

   #mail_print_sample_shipping_label_8x11_mm_package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service MM Package
    Then on Print form, select left side starting label
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button Sample

    #mail_print_sample_shipping_label_8x11_xm_fr_envelope
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Mail Service Priority Mail Express Flat Rate Envelope
    Then on Print form, select left side starting label
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button Sample

   #mail_print_sample_shipping_label_8x11_xm_lfr_envelope
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Mail Service Priority Mail Express Legal Flat Rate Envelope
    Then on Print form, select left side starting label
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button Sample

   #mail_print_sample_shipping_label_5x8_xm_package
    Then select Print On Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Mail Service Priority Mail Express Package
    Then on Print form, select left side starting label
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button Sample

   #mail_print_sample_shipping_label_5x8_xm_pfr_envelope
    Then select Print On Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Mail Service Priority Mail Express Padded Flat Rate Envelope
    Then on Print form, select left side starting label
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button Sample

    Then Sign out