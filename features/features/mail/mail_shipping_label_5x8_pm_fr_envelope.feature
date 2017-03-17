Feature: Mail Shipping Label - 5 ½” x 8 ½” - PM FR Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_5x8_pm_fr_envelope
  Scenario: Shipping Label - 5 ½” x 8 ½” - PM FR Envelope
    Then select Print On Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1

    Then set Print form Ounces to 1
    Then select Print form service PM Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out