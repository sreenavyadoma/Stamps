
Feature:  Requires x-number of label sheets

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_thermal_number_of_labels_count
  Scenario:  Printing
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then on Order Details form, select service PM Flat Rate Envelope
    Then set Order Details form Weight to 1 lb 1 oz
    Then in Orders Toolbar, click Print button
    Then expect Print modal number of required label sheets is 1
    Then expect Print modal Modal Title is "You have 1 label(s) ready to print"
    Then in Print modal, click Close button

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-To to random address between zone 5 and 8
    Then on Order Details form, select service PM Flat Rate Envelope
    Then set Order Details form Weight to 1 lb 1 oz
    Then set Order Details form Dimensions to Length 1 Width 1 Height 1


    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then on Order Details form, select service PM Small Flat Rate Box
    Then set Order Details form Weight to 1 lb 1 oz

    Then in Orders Grid, check row 1
    Then in Orders Grid, check row 2
    Then in Orders Grid, check row 3

    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Pause for 1 second
    Then expect Print modal number of required label sheets is 3
    Then in Print modal, click Close button

    Then Sign out
