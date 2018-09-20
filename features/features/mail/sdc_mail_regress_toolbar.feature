Feature:  Mail Print Form Toolbar

  Background:
    Given Start test driver

  @mail_print_button_labels
  Scenario: EBAPPS-11938 Label for printing stamps has incorrect text
    Then sign-in to mail
    Then select print on Stamps
    Then expect mail toolbar print button label is Print Stamps
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then expect mail toolbar print button label is Print Label
    Then select print on Envelope - #10, 4 ⅛" x 9 ½"
    Then expect mail toolbar print button label is Print Envelope
    Then select print on Roll - 4" x 6" Shipping Label
    Then expect mail toolbar print button label is Print Label
    Then sign out
