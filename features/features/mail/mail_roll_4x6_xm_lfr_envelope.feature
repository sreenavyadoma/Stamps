Feature: Mail Roll - 4" x 6" - XM LFR Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_roll_4x6_xm_lfr_envelope
  Scenario: Roll - 4" x 6" - XM LFR Envelope


    Then on Print form, select Roll - 4” x 6” Shipping Label

    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address Between Zone 5 through 8

    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then Mail Roll: Select service Priority Mail Express Legal Flat Rate Envelope
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "ZDesigner"
    Then in Mail Print modal, click Print button
    Then Sign out