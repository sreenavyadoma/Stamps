
Feature:  Requires x-number of label sheets

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_thermal_number_of_labels_count
  Scenario:  Printing
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Weight to 1 lb 1 oz
    Then In Orders Toolbar, click Print button
    Then In Print modal, expect number of required label sheets is 1
    Then In Print modal, expect Modal Title is "You have 1 label(s) ready to print"
    Then In Print modal, click Close button

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-To to address in Zone 5 through 8
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Weight to 1 lb 1 oz
    Then On Order Details form, set Dimensions to Length 1 Width 1 Height 1


    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Small Flat Rate Box
    Then On Order Details form, set Weight to 1 lb 1 oz

    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then In Orders Grid, check row 3

    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Pause for 1 second
    Then In Print modal, expect number of required label sheets is 3
    Then In Print modal, click Close button

    Then Sign out
