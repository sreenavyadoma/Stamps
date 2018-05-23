@print_dialog_printing_on_4x6_shipping_label
Feature: Print Media - Roll - 4" x 6"

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_printing_on_4x6
  Scenario:  Roll - 4" x 6"
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details service to PM Package
    Then set order details pounds to 1
    Then pause for 2 seconds
    Then click orders toolbar print button
    Then set Print modal Print-On to Roll - 4 x 6
    Then click print modal print button