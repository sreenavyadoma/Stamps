Feature: Print On List Of Values

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_on_list_of_values
  Scenario: Print On List Of Values
    Then select Print On Shipping Label - Paper
    Then select Print On Stamps
    Then select Print On Shipping Label - SDC-1200
    Then select Print On Shipping Label - 5x8
    Then select Print On Envelope - 10
    Then select Print On Envelope - 9
    Then select Print On Envelope - A9
    Then select Print On Envelope - 6
    Then select Print On Envelope - A2
    Then select Print On Envelope - 7
    Then select Print On Envelope - 11
    Then select Print On Envelope - 12
    Then select Print On Certified Mail Label - SDC-3610
    Then select Print On Certified Mail Label - SDC-3710
    Then select Print On Certified Mail Label - SDC-3910
    Then select Print On Certified Mail Label - SDC-3930
    Then select Print On Certified Mail Label - SDC-3810
    Then select Print On Roll 4x6
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then Sign out