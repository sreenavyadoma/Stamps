@bvt_mail_piece_validation

Feature: Manually verify all mail pieces in Staging

  Background:
    Given a valid user is signed in to Web Apps

  Scenario: Stamps B-Series
    Then select Print On Stamps
    Then show Advanced Options
    Then set Print form Serial Number to B12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then select Print form service Media Mail
    Then set Print form Amount to 2
    Then set Print form Quantity to 1
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then Sign out

  Scenario: Envelope - #10
    Then select Print On Envelope - 10
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then Sign out

  Scenario: Shipping Label - 8 ½" x 11" Paper
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then Sign out

  Scenario: Roll - 4" x 6" Shipping Label
    Then select Print On Roll 4x6
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PM Large Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer Zebra LP 2844 on qa-printlab2016
    Then click Mail Print modal Print button
    Then Sign out

  Scenario: Certified Mail Label - SDC-3610
#    Then select Print On Shipping Label - Paper
    Then select Print On Certified Mail Label - SDC-3610
    Then set Print form Mail-From to default
#    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then Sign out


  Scenario: Shipping Label - 8 ½" x 11" Paper
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Flat Rate Envelope
    Then show Advanced Options
    Then check Advanced Options Print Receipt
    Then Print Label
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then Sign out


