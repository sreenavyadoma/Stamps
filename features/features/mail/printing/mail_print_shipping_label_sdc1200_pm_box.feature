
@mail_print_shipping_label_sdc1200_pm_box
Feature: Mail Shipping Label - SDC-1200 - PM Box

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_sdc1200_pm_box_size
  Scenario: Shipping Label - SDC-1200 - PM Box Size

    #mail_print_shipping_label_sdc1200_pm_large_box
    Then select Print On Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PM Large Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_shipping_label_sdc1200_pm_medium_box
    Then select Print On Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PM Medium Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    #mail_print_shipping_label_sdc1200_pm_small_box
    Then select Print On Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Small Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_shipping_label_sdc1200_pm_regional_box
  Scenario: Shipping Label - SDC-1200 - PM Regional Box

   #mail_print_shipping_label_sdc1200_pm_regional_box_a
    Then select Print On Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Regional Rate Box A
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_shipping_label_sdc1200_pm_regional_box_b
    Then select Print On Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PM Regional Rate Box B
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then Sign out