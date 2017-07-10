
Feature:  Requires x-number of label sheets

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_two_up_x_number_of_labels
  Scenario:  Requires x-number of label sheets
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Weight to 1 lb 1 oz
    Then in Orders Toolbar, click Print button
    Then expect Print modal number of required label sheets is 1
    Then expect Print modal Modal Title is "You have 1 label(s) ready to print"
    Then in Print modal, click Close button

    Then add new order
    Then set Order Details form Ship-To to random address between zone 5 and 8
    Then set Order Details form service to PM Package
    Then set Order Details form Weight to 1 lb 1 oz
    Then set Order Details form Dimensions to Length 1 Width 1 Height 1

    Then check Orders Grid row 1
    Then check Orders Grid row 2

    Then in Orders Toolbar, click Print button
    Then expect Print modal number of required label sheets is 1
    Then expect Print modal Modal Title is "You have 2 label(s) ready to print"
    Then in Print modal, click Close button

    Then Sign out
