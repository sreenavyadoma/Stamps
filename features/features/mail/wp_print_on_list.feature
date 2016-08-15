Feature: Print On List Of Values

  Background:
    Given I am signed in as a postage shipper

  @wp_print_on_list_of_values
  Scenario: Print On List Of Values
    Then Postage: Select Shipping Label 8 x 11
    Then Postage: Select Stamps
    Then Postage: Select Shipping Label SDC-1200
    Then Postage: Select Shipping Label 5 x 8
    Then Postage: Select Envelope - #10
    Then Postage: Select Envelope - #9
    Then Postage: Select Envelope - #A9
    Then Postage: Select Envelope - #6
    Then Postage: Select Envelope - #A2
    Then Postage: Select Envelope - #7
    Then Postage: Select Envelope - #11
    Then Postage: Select Envelope - #12
    Then Postage: Select Certified Mail SDC-3610
    Then Postage: Select Certified Mail SDC-3710
    Then Postage: Select Certified Mail SDC-3910
    Then Postage: Select Certified Mail SDC-3810
    Then Postage: Select Roll 4 x 6
    Then Postage: Select Roll 4 ⅛ x 6 ¼
    Then Sign out