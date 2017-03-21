Feature: Envelopes BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_services
  Scenario: Envelope
    Then select Print On Stamps
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then select Print On Shipping Label - 5 ½" x 8 ½"
    Then select Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then select Print On Envelope - #9, 3 ⅞" x 8 ⅞"
    Then select Print On Envelope - #A9, 5 ¾" x 8 ¾"
    Then select Print On Envelope - #6, 3 ⅝" x 6 ½"
    Then select Print On Envelope - #A2, 4 ⅜" x 5 ¾"
    Then select Print On Envelope - #7, 3 ⅞" x 7 ½"
    Then select Print On Envelope - #11, 4 ½" x 10 ⅜"
    Then select Print On Envelope - #12, 4 ¾" x 11"
    Then on Print form, select Certified Mail Label - SDC-3610
    Then on Print form, select Certified Mail Label - SDC-3710
    Then on Print form, select Certified Mail Label - SDC-3910
    Then on Print form, select Certified Mail Label - SDC-3810
    Then select Print On Roll - 4" x 6" Shipping Label
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label

#set Order Details form Ship-To to a random address in Zone 1 through 4