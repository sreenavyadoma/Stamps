
@mail_print_shipping_label_5x8_mm_xm
Feature: Mail Shipping Label - 5 ½” x 8 ½” - MM XM

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_5x8_mm
  Scenario: Shipping Label - 5 ½” x 8 ½” - MM

    #mail_print_shipping_label_5x8_mm_package
    Then select Print On Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service MM Package
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

  @mail_print_shipping_label_5x8_xm
  Scenario: Shipping Label - 5 ½” x 8 ½” - XM

   #mail_print_shipping_label_5x8_xm_fr_envelope
    Then select Print On Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PME Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_5x8_xm_lfr_envelope
    Then select Print On Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PME Legal Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_5x8_xm_package
    Then select Print On Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PME Package
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_5x8_xm_pfr_envelope
    Then select Print On Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PME Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then Sign out