Feature: Envelopes BVT

  Background:
    Given I am signed in as Mail shipper

  @mail_services
  Scenario: Envelope
    Then Mail: Select Stamps
    Then Mail: Select Shipping Label - 8 ½” x 11” Paper
    Then Mail: Select Shipping Label - SDC-1200, 4 ¼” x 6 ¾”
    Then Mail: Select Shipping Label - 5 ½” x 8 ½”
    Then Mail: Select Envelope - #10, 4 ⅛” x 9 ½”
    Then Mail: Select Envelope - #9, 3 ⅞” x 8 ⅞”
    Then Mail: Select Envelope - #A9, 5 ¾” x 8 ¾”
    Then Mail: Select Envelope - #6, 3 ⅝” x 6 ½”
    Then Mail: Select Envelope - #A2, 4 ⅜” x 5 ¾”
    Then Mail: Select Envelope - #7, 3 ⅞” x 7 ½”
    Then Mail: Select Envelope - #11, 4 ½” x 10 ⅜”
    Then Mail: Select Envelope - #12, 4 ¾” x 11”
    Then Mail: Select Certified Mail Label - SDC-3610
    Then Mail: Select Certified Mail Label - SDC-3710
    Then Mail: Select Certified Mail Label - SDC-3910
    Then Mail: Select Certified Mail Label - SDC-3810
    Then Mail: Select Roll - 4” x 6” Shipping Label
    Then Mail: Select Roll - 4 ⅛” x 6 ¼” Shipping Label

