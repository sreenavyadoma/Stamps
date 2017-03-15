Feature: Stamps BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_stamps

  Scenario: Stamps Specify Postage
    Then select Print On Stamps

    Then set Stamps Serial Number to random C series
    Then select Stamps Specify Postage Amount
    Then set Print form Mail-From to default
    Then select Print form service Media Mail
    Then set Stamps Amount to 2.85
    Then set Stamps Quantity to 1
    Then set Stamps Reference Number to Stamp3221
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then set Stamps Serial Number to random B series
    Then select Stamps Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then Sign out


