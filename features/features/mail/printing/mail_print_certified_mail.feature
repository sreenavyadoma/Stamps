@mail_print_certified_mail_hidden_postage
Feature: Print Certified Mail (with hidden postage)

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_SDC_3610_hidden_postage
  Scenario: Print SDC 3610 (with hidden postage)

    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then show Advanced Options
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then select Print On Certified Mail Label - SDC-3610
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_SDC_3710_hidden_postage
  Scenario: Print SDC 3610 (with hidden postage)

    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then show Advanced Options
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then select Print On Certified Mail Label - SDC-3710
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_SDC_3910_hidden_postage
  Scenario: Print SDC 3610 (with hidden postage)

    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then show Advanced Options
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then select Print On Certified Mail Label - SDC-3910
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_SDC_3930_hidden_postage
  Scenario: Print SDC 3610 (with hidden postage)

    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then show Advanced Options
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then select Print On Certified Mail Label - SDC-3930
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_SDC_3810_hidden_postage
  Scenario: Print SDC 3610 (with hidden postage)

    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then show Advanced Options
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then select Print On Certified Mail Label - SDC-3810
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_SDC_3830_hidden_postage
  Scenario: Print SDC 3610 (with hidden postage)

    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then show Advanced Options
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then select Print On Certified Mail Label - SDC-3830
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button