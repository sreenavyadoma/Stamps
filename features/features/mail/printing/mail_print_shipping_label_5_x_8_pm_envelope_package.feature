
@mail_print_shipping_label_5x8_pm_envelope_package
Feature: Mail Shipping Label - 5 ½” x 8 ½” - PM Envelope Package

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_5x8_pm_envelope
  Scenario: Shipping Label - 5 ½” x 8 ½” - PM Envelope

    #mail_print_shipping_label_5x8_pm_fr_envelope
    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_5x8_pm_large_envelope
    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Large/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_5x8_pm_lfr_envelope
    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Legal Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_5x8_pm_pfr_envelope
    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PM Padded Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

  @mail_print_shipping_label_5x8_pm_package
  Scenario: Shipping Label - 5 ½” x 8 ½” - PM Package

   #mail_print_shipping_label_5x8_pm_large_package
    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Large Package
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_5x8_pm_package
    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then Sign out