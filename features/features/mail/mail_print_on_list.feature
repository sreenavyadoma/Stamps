Feature: Print On List Of Values

  Background:
    Given I am signed in as a postage shipper

  @wp_print_on_list_of_values
  Scenario: Print On List Of Values
    Then Mail: Select Shipping Label 8 x 11
    Then Mail: Select Stamps
    Then Mail: Select Shipping Label SDC-1200
    Then Mail: Select Shipping Label 5 x 8
    Then Mail: Select Envelope - #10
    Then Mail: Select Envelope - #9
    Then Mail: Select Envelope - #A9
    Then Mail: Select Envelope - #6
    Then Mail: Select Envelope - #A2
    Then Mail: Select Envelope - #7
    Then Mail: Select Envelope - #11
    Then Mail: Select Envelope - #12
    Then Mail: Select Certified Mail SDC-3610
    Then Mail: Select Certified Mail SDC-3710
    Then Mail: Select Certified Mail SDC-3910
    Then Mail: Select Certified Mail SDC-3810
    Then Mail: Select Roll 4 x 6
    Then Mail: Select Roll 4 ⅛ x 6 ¼
    Then Sign out