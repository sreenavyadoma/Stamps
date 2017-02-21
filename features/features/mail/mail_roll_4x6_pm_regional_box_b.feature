Feature: Mail Roll - 4" x 6" - PM Regional Box B



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_roll_4x6_pm_regional_box_b
  Scenario: Roll - 4" x 6" - PM Regional Box B


    Then select Print On Roll - 4" x 6" Shipping Label

    Then set Print form Mail From to default
    Then set Print form Mail to country to United States
    Then on Print form, set Mail To address to zone 1 through 4

    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service Priority Mail Regional Rate Box B
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button
    Then Sign out