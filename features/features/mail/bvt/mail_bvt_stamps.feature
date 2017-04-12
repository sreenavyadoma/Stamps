Feature: Print form BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_stamps

  Scenario: Print form Specify Postage
    Then select Print On Stamps

    Then set Print form Serial Number to C12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then select Print form service Media Mail
    Then set Print form Amount to 2.85
    Then set Print form Quantity to 1
    Then set Advanced Options Reference Number to Stamp3221
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then set Print form Serial Number to B12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then Sign out


