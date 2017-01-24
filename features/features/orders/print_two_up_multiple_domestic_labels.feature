
Feature: Print two labels on one sheet

  Background:
    Given I launched browser ff

  @print_two_up_multiple_domestic_labels
  Scenario: User Prints multiple Domestic labels

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 5 through 8
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Weight to 1 lb 1 oz
    Then On Order Details form, set Dimensions to Length 1 Width 1 Height 1
    Then On Order Details form, set Insure-For to $50.25
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Weight to 1 lb 1 oz
    Then On Order Details form, set Insure-For to $10
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Grid, check row 2

    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then In Print modal, set Printer to "factory"

    Then In Print modal, select right-side label
    Then In Print modal, expect right-side label selected
    Then In Print modal, click Print button

    Then Pause for 6 seconds
    Then Sign out








