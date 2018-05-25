
@mail_print_shipping_label_sdc1200_pm_envelope_package
Feature: Mail Shipping Label - SDC-1200 - PM Envelope Package

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_sdc1200_pm_envelope
  Scenario: Shipping Label - SDC-1200 - PM Envelope

   #mail_print_shipping_label_sdc1200_pm_fr_envelope
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PM Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_shipping_label_sdc1200_pm_large_envelope
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PM Large/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_shipping_label_sdc1200_pm_lfr_envelope
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PM Legal Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_shipping_label_sdc1200_pm_pfr_envelope
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Padded Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_shipping_label_sdc1200_pm_package
  Scenario: Shipping Label - SDC-1200 - PM Package

    #mail_print_shipping_label_sdc1200_pm_large_package
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form ounces to 1
    Then select print form service PM Large Package
    Then set Dimensions to length 2 width 2 height 2
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_shipping_label_sdc1200_pm_package
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Package
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then sign out