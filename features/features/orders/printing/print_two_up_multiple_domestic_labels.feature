
Feature: Print two labels on one sheet

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_multiple_domestic_labels
  Scenario: User Prints multiple Domestic labels

    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address in zone 8
    Then set order details service to PM Flat Rate Envelope
    Then set order details weight to 1 lb 1 oz
    Then set order details dimensions to length 1 width 1 height 1
    # Then set order details tracking to Signature Required

    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Flat Rate Envelope
    Then set order details weight to 1 lb 1 oz
    # Then set order details tracking to Signature Required

    Then check row 2

    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

    Then pause for 6 seconds
    Then sign out








