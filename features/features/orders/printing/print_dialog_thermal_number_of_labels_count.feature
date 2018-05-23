
Feature:  Requires x-number of label sheets

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_thermal_number_of_labels_count
  Scenario:  Printing
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Flat Rate Envelope
    Then set order details weight to 1 lb 1 oz
    Then click orders toolbar print button
    Then expect Print modal number of required label sheets is 1
    #Then expect Print modal Modal Title is "You have 1 label(s) ready to print"
    Then in print modal, click close button

    Then add new order
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details service to PM Flat Rate Envelope
    Then set order details weight to 1 lb 1 oz


    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Small Flat Rate Box
    Then set order details weight to 1 lb 1 oz

    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then check Orders Grid row 3

    Then click orders toolbar print button
    Then set print modal print-on to Roll - 418x614
    Then pause for 1 second
    Then expect Print modal number of required label sheets is 3
    Then in print modal, click close button

    Then sign out
