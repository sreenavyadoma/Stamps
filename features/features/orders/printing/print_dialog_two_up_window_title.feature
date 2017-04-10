
Feature:  Print Window Title - You have x-number of labels ready to print

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_two_up_window_title
  Scenario:  Printing
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo, CA
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Weight to 1 lb 1 oz
    Then in Orders Toolbar, click Print button
    Then expect Print modal Modal Title is "You have 1 label(s) ready to print"
    Then in Print modal, click Close button

    Then click Orders Toolbar Add button
    Then set Order Details form Ship-To to random address between zone 5 and 8
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Weight to 1 lb 1 oz
    Then set Order Details form Dimensions to Length 1 Width 1 Height 1
    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then in Orders Toolbar, click Print button
    Then expect Print modal Modal Title is "You have 2 label(s) ready to print"
    Then in Print modal, click Close button

    Then Sign out
