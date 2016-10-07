
Feature:  Requires x-number of label sheets

  Background:
    Given I am signed in to Orders

  @print_dialog_thermal_number_of_labels_count
  Scenario:  Printing
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 1 lbs 1 oz
    Then Print: Open Modal
    Then Print: Expect number of required label sheets to be 1
    Then Print: Expect Modal Title to be "You have 1 label(s) ready to print"
    Then Print: Close Modal

    Then Toolbar: Add
    Then Details: Set Ship-To to address in Zone 5 through 8
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 1 lbs 1 oz
    Then Details: Set Dimensions to Length 1 Width 1 Height 1


    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 1 lbs 1 oz

    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Grid: Check row 3

    Then Print: Open Modal
    Then Print: Set Printing On "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Pause for 1 second
    Then Print: Expect number of required label sheets to be 3
    Then Print: Close Modal

    Then Sign out
