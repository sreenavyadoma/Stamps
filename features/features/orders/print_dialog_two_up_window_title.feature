
Feature:  Print Window Title - You have x-number of labels ready to print

  Background:
    Given A user is signed in to Orders

  @print_dialog_two_up_window_title
  Scenario:  Printing
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Weight to 1 lb 1 oz
    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Modal Title is "You have 1 label(s) ready to print"
    Then In Print modal, click Close button

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-To to address in Zone 5 through 8
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Weight to 1 lb 1 oz
    Then On Order Details form, set Dimensions to Length 1 Width 1 Height 1
    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Modal Title is "You have 2 label(s) ready to print"
    Then In Print modal, click Close button

    Then Sign out
