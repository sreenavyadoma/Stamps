Feature: Mail Roll - 4 ⅛” x 6 ¼” - PM PFR Envelope


  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_roll_4_1_8_x_6_1_4_pm_pfr_envelope
  Scenario: Roll - 4 ⅛” x 6 ¼” - PM PFR Envelope

    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label

    Then set Print form Mail From to default
    Then set Label form Mail To Country to United States
    Then set Label form Mail To to a random address in zone 1 through 4

    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Padded Flat Rate Envelope
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button
    Then Sign out