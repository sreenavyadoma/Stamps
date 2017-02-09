Feature: Envelopes BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_services
  Scenario: Envelope
    Then on Print form, select Stamps
    Then on Shipping Label Print form, select Shipping Label - 8 ½” x 11” Paper
    Then on Shipping Label Print form, select Shipping Label - SDC-1200, 4 ¼” x 6 ¾”
    Then on Shipping Label Print form, select Shipping Label - 5 ½” x 8 ½”
    Then on Envelopes Print form, select Envelope - #10, 4 ⅛” x 9 ½”
    Then on Envelopes Print form, select Envelope - #9, 3 ⅞” x 8 ⅞”
    Then on Envelopes Print form, select Envelope - #A9, 5 ¾” x 8 ¾”
    Then on Envelopes Print form, select Envelope - #6, 3 ⅝” x 6 ½”
    Then on Envelopes Print form, select Envelope - #A2, 4 ⅜” x 5 ¾”
    Then on Envelopes Print form, select Envelope - #7, 3 ⅞” x 7 ½”
    Then on Envelopes Print form, select Envelope - #11, 4 ½” x 10 ⅜”
    Then on Envelopes Print form, select Envelope - #12, 4 ¾” x 11”
    Then on Print form, select Certified Mail Label - SDC-3610
    Then on Print form, select Certified Mail Label - SDC-3710
    Then on Print form, select Certified Mail Label - SDC-3910
    Then on Print form, select Certified Mail Label - SDC-3810
    Then on Print form, select Roll - 4” x 6” Shipping Label
    Then on Print form, select Roll - 4 ⅛” x 6 ¼” Shipping Label

