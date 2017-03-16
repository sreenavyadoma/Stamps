Feature: Mail Shipping Label - 8 ½” x 11” Paper - XM Legal Flat Rate Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_8x11_xm_lfr_envelope
  Scenario: Shipping Label - 8 ½” x 11” Paper - XM Legal Flat Rate Envelope
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service PME Legal Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out