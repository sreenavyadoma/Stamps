
Feature: Change Starting Label Position

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_label_sides
  Scenario:  Print Modal Starting Label

    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set Orders print modal printer
    Then expect Print modal left-side label is selected
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set Orders print modal printer
    Then expect Print modal left-side label is selected
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

    Then sign out
