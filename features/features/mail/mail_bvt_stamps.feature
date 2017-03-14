Feature: Stamps BVT



  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_stamps

  Scenario: Stamps Specify Postage
    Then select Print On Stamps

    Then set Stamps Serial Number to random S series
    Then select Stamps Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Stamps Amount to 4.65
    Then Mail Stamps: Set Quantity to 3
    Then set Stamps Reference Number to Stamp3221
    Then Mail Stamps: Set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then set Stamps Serial Number to random L series
    Then select Stamps Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then Mail Stamps: Set Weight 0 lb 1 oz
    Then select Print form service First Class
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then Sign out

  #@mail_bvt_stamps_calculate
  #Scenario: Stamps Calculate Postage
  #  Then select Print On Stamps
  #  Then Sign out

