Feature: Envelopes BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_services
  Scenario: Envelope
    Then select Print form Print On Stamps
    Then select Print On Shipping Label - 8 x 11 Paper on Print form
    Then select Print On Shipping Label - SDC-1200 Paper on Print form
    Then select Print On Shipping Label - 5 x 8 on Print form
    Then select Print form Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then on Print form, select Envelope - #9
    Then on Print form, select Envelope - #A9
    Then on Print form, select Envelope - #6
    Then on Print form, select Envelope - #A2, 4 ⅜” x 5 ¾”
    Then on Print form, select Envelope - #7
    Then on Print form, select Envelope - #11
    Then on Print form, select Envelope - #12”
    Then on Print form, select Certified Mail Label - SDC-3610
    Then on Print form, select Certified Mail Label - SDC-3710
    Then on Print form, select Certified Mail Label - SDC-3910
    Then on Print form, select Certified Mail Label - SDC-3810
    Then on Print form, select Roll - 4” x 6” Shipping Label
    Then on Print form, select Roll - 4 ⅛” x 6 ¼” Shipping Label

