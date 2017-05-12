
@mail_print_shipping_label_8_x_11_fcm_psg
Feature: Mail Shipping Label - 8 ½” x 11” FCM PSG Paper

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_8_x_11_fcm
  Scenario: Shipping Label - 8 ½” x 11” FCM Paper

    #mail_print_shipping_label_8x11_fcm_large_envelope
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    #mail_print_shipping_label_8x11_fcm_package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service FCM Package/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

  @mail_print_shipping_label_8_x_11_psg
  Scenario: Shipping Label - 8 ½” x 11” PSG Paper

   #mail_print_shipping_label_8x11_psg_large_package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service PSG Large Package
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_psg_oversized_package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service PSG Oversized Package
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_psg_package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service PSG Package
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then Sign out