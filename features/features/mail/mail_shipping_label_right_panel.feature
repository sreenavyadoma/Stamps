Feature: Extra Services BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_right_panel
  Scenario: Shipping Label Right Panel

    Then on Shipping Label Print form, select Shipping Label - 5 ½” x 8 ½”

    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address Between Zone 1 through 4
    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then on Shipping Label Print form, set service to Priority Mail Package
    Then on Shipping Label Print form, set Hide Mail Value to Unchecked
    Then on Shipping Label Print form, set Print Receipt to Checked
    Then on Shipping Label Print form, set Print Reference Number to Checked
    Then on Shipping Label Print form, set Reference Number to 12345
    Then on Shipping Label Print form, set Cost Code to None
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "factory"
    Then in Mail Print modal, click Print button
    Then Sign out
