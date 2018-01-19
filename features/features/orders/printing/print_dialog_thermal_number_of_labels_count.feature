
Feature:  Requires x-number of label sheets

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_thermal_number_of_labels_count
  Scenario:  Printing
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PM Flat Rate Envelope
    Then set Order Details Weight to 1 lb 1 oz
    Then click Orders Toolbar Print button
    Then expect Print modal number of required label sheets is 1
    #Then expect Print modal Modal Title is "You have 1 label(s) ready to print"
    Then in Print modal, click Close button

    Then add new order
    Then set Order Details Ship-To to random address between zone 5 and 8
    Then set Order Details service to PM Flat Rate Envelope
    Then set Order Details Weight to 1 lb 1 oz


    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PM Small Flat Rate Box
    Then set Order Details Weight to 1 lb 1 oz

    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then check Orders Grid row 3

    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Roll - 418x614
    Then Pause for 1 second
    Then expect Print modal number of required label sheets is 3
    Then in Print modal, click Close button

    Then Sign out
