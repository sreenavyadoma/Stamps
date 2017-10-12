Feature: Mail Shipping Label - Right Side



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_label_right_side
  Scenario: Right Side Shipping Label - 8 ½” x 11” Paper

    Then select Print On Shipping Label - Paper

    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4

    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then on Print form, select right side starting label
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then Sign out

  @mail_print_label_right_side
  Scenario: Right Side Shipping Label -  5 ½” x 8 ½”

    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then on Print form, select right side starting label
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then Sign out

  @mail_print_label_right_side
  Scenario: Right Side Shipping Label -  SDC-1200

    Then select Print On Shipping Label - SDC-1200

    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4

    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then on Print form, select right side starting label
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then Sign out