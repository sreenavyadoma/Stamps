
Feature: Change Starting Label Position

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_label_sides
  Scenario:  Print Modal Starting Label

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then set Order Details form Ounces to 1
    Then in Orders Toolbar, click Print button
    Then set Print modal Printer to "factory"
    Then expect Print modal left-side label is selected
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then set Order Details form Ounces to 1
    Then in Orders Toolbar, click Print button
    Then set Print modal Printer to "factory"
    Then expect Print modal left-side label is selected
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

    Then Sign out