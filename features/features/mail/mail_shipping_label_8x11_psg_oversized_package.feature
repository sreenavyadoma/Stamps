Feature: Mail Shipping Label - 8 ½” x 11” Paper - PSG Oversized Package



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_8x11_psg_oversized_package
  Scenario: Shipping Label - 8 ½” x 11” Paper - PSG Oversized Package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service Parcel Select Ground Oversized Package
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out