Feature: Mail Roll - 4" x 6" - PM Large Envelope



  Background:
    Given I am signed in as Mail shipper


  @mail_roll_4x6_pm_large_envelope
  Scenario: Roll - 4" x 6" - PM Large Envelope


    Then Mail: Select Roll 4 x 6

    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4

    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Roll: Select Service Priority Mail Large-Thick Envelope
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "ZDesigner"
    Then Mail Print Modal: Print
    Then Sign out