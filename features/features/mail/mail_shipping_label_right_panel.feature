Feature: Extra Services BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_right_panel
  Scenario: Shipping Label Right Panel

    Then select Print On Shipping Label - 5 x 8 on Print form

    Then set Print form Mail From to default
    Then set Print form Mail to country to United States
    Then on Print form, set Mail To address to zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then on Shipping Label Print form, set Hide Mail Value to Unchecked
    Then on Shipping Label Print form, set Print Receipt to Checked
    Then on Shipping Label Print form, set Print Reference Number to Checked
    Then on Shipping Label Print form, set Reference Number to 12345
    Then on Shipping Label Print form, set Cost Code to None
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out
