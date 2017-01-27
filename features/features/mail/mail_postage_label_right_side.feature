Feature: Mail Shipping Label - Right Side



  Background:
    Given I am signed in as Mail shipper


  @mail_print_label_right_side
  Scenario: Right Side Shipping Label - 8 ½” x 11” Paper

    Then Mail: Select Shipping Label - 8 ½” x 11” Paper

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Set service to Priority Mail Package
    Then Mail Shipping Labels: Select right side starting label
    Then Mail: Open Print Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button
    Then Sign out

  @mail_print_label_right_side
  Scenario: Right Side Shipping Label -  5 ½” x 8 ½”

    Then Mail: Select Shipping Label - 5 ½” x 8 ½”

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Set service to Priority Mail Package
    Then Mail Shipping Labels: Select right side starting label
    Then Mail: Open Print Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button
    Then Sign out

  @mail_print_label_right_side
  Scenario: Right Side Shipping Label -  SDC-1200

    Then Mail: Select Shipping Label - SDC-1200, 4 ¼” x 6 ¾”

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Set service to Priority Mail Package
    Then Mail Shipping Labels: Select right side starting label
    Then Mail: Open Print Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button
    Then Sign out