
Feature: Print two labels on one sheet

  Background:
    Given I launched browser ff

  @print_two_up_multiple_domestic_labels
  Scenario: User Prints multiple Domestic labels

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 5 through 8
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Weight to 1 lb 1 oz
    Then on Order Details form, set Dimensions to Length 1 Width 1 Height 1
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Weight to 1 lb 1 oz
    Then on Order Details form, set Tracking to Signature Required

    Then In Orders Grid, check row 2

    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, set Printer to "factory"

    Then in Print modal, select right-side label
    Then in Print modal, expect right-side label selected
    Then in Print modal, click Print button

    Then Pause for 6 seconds
    Then Sign out








