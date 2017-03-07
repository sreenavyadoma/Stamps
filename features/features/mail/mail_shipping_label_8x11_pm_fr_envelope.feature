Feature: Mail Shipping Label - 8 ½” x 11” Paper - PM FR Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_8x11_pm_fr_envelope
  Scenario: Shipping Label - 8 ½” x 11” Paper - PM FR Envelope

    Then select Print On Shipping Label - 8 ½" x 11" Paper

    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Mail Service Priority Mail Flat Rate Envelope
    Then on Print form, select left side starting label
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out