Feature: Manage Print Options

  Background:
    Given Start test driver

  @mail_manage_printing_options
  Scenario: Manage Print Options
    Then sign-in to Mail
    Then select Print On Manage Printing Options...
    Then expect manage print options modal is present
    Then check Stamps in manage print options
    Then check Shipping Label - 8 ½" x 11" Paper in manage print options
    Then check Shipping Label - SDC-1200, 4 ¼" x 6 ¾" in manage print options
    Then check Shipping Label - 5 ½" x 8 ½" in manage print options
    Then check Envelope - #10, 4 ⅛" x 9 ½" in manage print options
    Then check Envelope - #9, 3 ⅞" x 8 ⅞" in manage print options
    Then check Envelope - #A9, 5 ¾" x 8 ¾" in manage print options
    Then check Envelope - #6, 3 ⅝" x 6 ½" in manage print options
    Then check Envelope - #A2, 4 ⅜" x 5 ¾" in manage print options
    Then check Envelope - #7, 3 ⅞" x 7 ½" in manage print options
    Then check Envelope - #11, 4 ½" x 10 ⅜" in manage print options
    Then check Envelope - #12, 4 ¾" x 11" in manage print options
    Then check Certified Mail Label - SDC-3610 in manage print options
    Then check Certified Mail Label - SDC-3710 in manage print options
    Then check Certified Mail Label - SDC-3910 in manage print options
    Then check Certified Mail Label - SDC-3930 in manage print options
    Then check Certified Mail #11 Envelope - SDC-3810 in manage print options
    Then check Certified Mail #11 Envelope - SDC-3830 in manage print options
    Then check Roll - 4" x 6" Shipping Label in manage print options
    Then check Roll - 4 ⅛" x 6 ¼" Shipping Label in manage print options
    Then click save in manage print options
    Then Sign out