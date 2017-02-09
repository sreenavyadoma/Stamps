Feature: Mail Sample Shipping Label - 5 ½” x 8 ½” - MM Package



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_sample_shipping_label_5x8_mm_package
  Scenario: Sample Shipping Label - 5 ½” x 8 ½” - MM Package

    Then on Shipping Label Print form, select Shipping Label - 5 ½” x 8 ½”

    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address Between Zone 5 through 8
    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then on Shipping Label Print form, select service Media Mail Package
    Then on Shipping Label Print form, select left side starting label
    Then Mail: Open Print Sample Modal
    Then in Mail Print modal, select Printer "factory"
    Then in Mail Print modal, click Print button Sample
    Then Sign out