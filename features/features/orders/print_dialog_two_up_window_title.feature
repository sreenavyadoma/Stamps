
Feature:  Print Window Title - You have x-number of labels ready to print

  Background:
    Given I am signed in to Orders

  @print_dialog_two_up_window_title
  Scenario:  Printing
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Weight to 1 lb 1 oz
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Modal Title is "You have 1 label(s) ready to print"
    Then Print Modal: Close Print Modal

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Weight to 1 lb 1 oz
    Then Order Details: Set Dimensions to Length 1 Width 1 Height 1
    Then Orders Grid: Check row 1
    Then Orders Grid: Check row 2
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Modal Title is "You have 2 label(s) ready to print"
    Then Print Modal: Close Print Modal

    Then Sign out
