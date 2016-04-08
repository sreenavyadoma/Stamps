
Feature: Change Starting Label Position to Left Side

  Background:
    Given I am signed in to Orders

  @print_label_left_side
  Scenario:  Print Label - Left Side
    Then Add New Order
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Insure-For to $100.00
    Then Details: Set Ounces to 1
    Then Details: Set Pounds to 1
    Then Details: Set Tracking to "Signature Required"
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Expect
    Then Details: Expect Total to be $52.31

    Then Details: Set Ship-To to Random Address in Zone 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Ounces to 1
    Then Details: Set Pounds to 1
    Then Details: Check Insure-For checkbox
    Then Details: Expect Insure-For Textbox to be enabled
    Then Details: Set Insure-For to $100.00
    Then Pause for 2 seconds
    Then Details: Expect Insure-For to be $100.00
    Then Details: Expect Insure-For Cost to be greater than $1.00
    #Then Grid: Expect Insured Value to be $100.00
    Then Details: Uncheck Insure-For checkbox
    Then Pause for 2 seconds
    Then Details: Expect Insure-For Textbox to be disabled
    Then Details: Expect Insure-For to be $0.00
    Then Details: Expect Insure-For Cost to be $0.00



    Then Sign out
