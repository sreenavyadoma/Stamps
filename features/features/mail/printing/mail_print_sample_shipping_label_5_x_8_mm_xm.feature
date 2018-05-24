
@mail_print_sample_shipping_label_5x8_mm_xm
Feature: Mail Sample Shipping Label - 5 ½” x 8 ½” - MM XM

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_sample_shipping_label_5x8_mm
  Scenario: Sample Shipping Label - 5 ½” x 8 ½” - MM

    #mail_print_sample_shipping_label_5x8_mm_package
    Then select print on Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select print form service MM Package/Flat/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_sample_shipping_label_5x8_xm
  Scenario: Sample Shipping Label - 5 ½” x 8 ½” - XM

   #mail_print_sample_shipping_label_5x8_xm_fr_envelope
    Then select print on Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select print form service PME Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_5x8_xm_lfr_envelope
    Then select print on Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select print form service PME Legal Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_5x8_xm_package
    Then select print on Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select print form service PME Package/Flat/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_5x8_xm_pfr_envelope
    Then select print on Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select print form service PME Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    
    Then sign out