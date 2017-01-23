
Feature:  Requires x-number of label sheets

  Background:
    Given I am signed in to Orders

  @print_dialog_thermal_number_of_labels_count
  Scenario:  Printing
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Weight to 1 lb 1 oz
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect number of required label sheets is 1
    Then Print Modal: Expect Modal Title is "You have 1 label(s) ready to print"
    Then Print Modal: Close Print Modal

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Weight to 1 lb 1 oz
    Then Order Details: Set Dimensions to Length 1 Width 1 Height 1


    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Small Flat Rate Box
    Then Order Details: Set Weight to 1 lb 1 oz

    Then Orders Grid: Check row 1
    Then Orders Grid: Check row 2
    Then Orders Grid: Check row 3

    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Pause for 1 second
    Then Print Modal: Expect number of required label sheets is 3
    Then Print Modal: Close Print Modal

    Then Sign out
