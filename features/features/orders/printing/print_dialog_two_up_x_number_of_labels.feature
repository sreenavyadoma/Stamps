
Feature:  Requires x-number of label sheets

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_two_up_x_number_of_labels
  Scenario:  Requires x-number of label sheets
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details service to PM Flat Rate Envelope
    Then set Order Details Weight to 1 lb 1 oz

    Then click orders toolbar print button
    Then expect Print modal number of required label sheets is 1
    Then expect Print modal Modal Title is "You have 1 label(s) ready to print"
    Then in print modal, click close button

    Then add new order
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details service to PM Flat Rate Envelope
    Then set Order Details Weight to 1 lb 1 oz

    Then check Orders Grid row 1
    Then check Orders Grid row 2

    Then click orders toolbar print button
    Then expect Print modal number of required label sheets is 1
    Then expect Print modal Modal Title is "You have 2 label(s) ready to print"
    Then in print modal, click close button

    Then sign out
