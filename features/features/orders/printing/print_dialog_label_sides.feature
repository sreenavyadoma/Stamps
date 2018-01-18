
Feature: Change Starting Label Position

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_label_sides
  Scenario:  Print Modal Starting Label

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set Order Details Ounces to 1
    Then click Orders Toolbar Print button
    Then set Orders print modal printer
    Then expect Print modal left-side label is selected
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set Order Details Ounces to 1
    Then click Orders Toolbar Print button
    Then set Orders print modal printer
    Then expect Print modal left-side label is selected
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

    Then Sign out
