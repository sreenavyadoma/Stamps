
Feature: Print two labels on one sheet

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_multiple_domestic_labels
  Scenario: User Prints multiple Domestic labels

    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo
    Then set Order Details form Ship-To to random address between zone 5 and 8
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Weight to 1 lb 1 oz
    Then set Order Details form Dimensions to Length 1 Width 1 Height 1
    Then set Order Details form Tracking to Signature Required

    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Weight to 1 lb 1 oz
    Then set Order Details form Tracking to Signature Required

    Then check Orders Grid row 2

    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then set Print modal Printer to "factory"

    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then in Print modal, click Print button

    Then Pause for 6 seconds
    Then Sign out








