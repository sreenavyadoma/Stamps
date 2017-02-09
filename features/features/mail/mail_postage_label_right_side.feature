Feature: Mail Shipping Label - Right Side



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_label_right_side
  Scenario: Right Side Shipping Label - 8 ½” x 11” Paper

    Then on Shipping Label Print form, select Shipping Label - 8 ½” x 11” Paper

    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address Between Zone 1 through 4
    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then on Shipping Label Print form, set service to Priority Mail Package
    Then on Shipping Label Print form, select right side starting label
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "factory"
    Then in Mail Print modal, click Print button
    Then Sign out

  @mail_print_label_right_side
  Scenario: Right Side Shipping Label -  5 ½” x 8 ½”

    Then on Shipping Label Print form, select Shipping Label - 5 ½” x 8 ½”

    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address Between Zone 1 through 4
    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then on Shipping Label Print form, set service to Priority Mail Package
    Then on Shipping Label Print form, select right side starting label
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "factory"
    Then in Mail Print modal, click Print button
    Then Sign out

  @mail_print_label_right_side
  Scenario: Right Side Shipping Label -  SDC-1200

    Then on Shipping Label Print form, select Shipping Label - SDC-1200, 4 ¼” x 6 ¾”

    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address Between Zone 1 through 4
    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then on Shipping Label Print form, set service to Priority Mail Package
    Then on Shipping Label Print form, select right side starting label
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "factory"
    Then in Mail Print modal, click Print button
    Then Sign out