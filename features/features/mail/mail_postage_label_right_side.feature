Feature: Mail Shipping Label - Right Side



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_label_right_side
  Scenario: Right Side Shipping Label - 8 ½” x 11” Paper

    Then select Print On Shipping Label - 8 ½" x 11" Paper

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then on Print form, select right side starting label
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out

  @mail_print_label_right_side
  Scenario: Right Side Shipping Label -  5 ½” x 8 ½”

    Then select Print On Shipping Label - 5 ½" x 8 ½"

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then on Print form, select right side starting label
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out

  @mail_print_label_right_side
  Scenario: Right Side Shipping Label -  SDC-1200

    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then on Print form, select right side starting label
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out