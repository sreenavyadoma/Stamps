
Feature: Change Starting Label Position to Right Side

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_label_right_side
  Scenario:  Print Label - Right Side
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then set Order Details form Ounces to 1
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then expect Print modal right-side label is selected
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then in Print modal, click Print button

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Package
    Then set Order Details form Ounces to 1
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then expect Print modal right-side label is selected
    Then in Print modal, click Print button

    Then Sign out
