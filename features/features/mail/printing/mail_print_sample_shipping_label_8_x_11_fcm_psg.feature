
@mail_print_sample_shipping_label_8_x_11_fcm_psg
Feature: Mail Sample Shipping Label - 8 ½” x 11” FCM PSG Paper

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_sample_shipping_label_8_x_11_fcm
  Scenario: Sample Shipping Label - 8 ½” x 11” FCM Paper

   #mail_print_sample_shipping_label_8x11_fcm_large_envelope
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope/Flat
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_8x11_fcm_package
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service FCM Package/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_sample_shipping_label_8_x_11_psg
  Scenario: Sample Shipping Label - 8 ½” x 11” PSG Paper

   #mail_print_sample_shipping_label_8x11_psg_large_package
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PSG Large Package
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_8x11_psg_oversized_package
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PSG Oversized Package
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_8x11_psg_package
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PSG Package/Flat/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then sign out