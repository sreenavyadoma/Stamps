Feature: Extra Services BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_right_panel
  Scenario: Shipping Label Right Panel

    Then select Print On Shipping Label - 5x8

    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4

    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then set Shipping Label Print form Hide Mail Value to Unchecked
    Then set Shipping Label Print form Print Receipt to Checked
    Then set Shipping Label Print form Print Reference Number to Checked
    Then set Shipping Label Advanced Options Reference Number to 12345
    Then set Shipping Label Advanced Options Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then Sign out
