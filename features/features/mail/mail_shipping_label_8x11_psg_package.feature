Feature: Mail Shipping Label - 8 ½” x 11” Paper - PSG Package



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_8x11_psg_package
  Scenario: Shipping Label - 8 ½” x 11” Paper - PSG Package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service Parcel Select Ground Package
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out