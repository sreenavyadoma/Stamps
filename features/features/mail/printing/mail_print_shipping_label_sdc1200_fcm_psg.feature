
@mail_print_shipping_label_sdc1200_fcm_psg
Feature: Mail Shipping Label - SDC-1200 - FCM PSG

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_sdc1200_fcm
  Scenario: Shipping Label - sdc1200 - FCM Paper

   #mail_print_shipping_label_sdc1200_fcm_large_envelope
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_shipping_label_sdc1200_fcm_package
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service FCM Package/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_shipping_label_sdc1200_psg
  Scenario: Shipping Label - sdc1200 - PSG Paper

   #mail_print_shipping_label_sdc1200_psg_large_package
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PSG Large Package
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_shipping_label_sdc1200_psg_oversized_package
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PSG Oversized Package
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_shipping_label_sdc1200_psg_package
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PSG Package/Flat/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then sign out