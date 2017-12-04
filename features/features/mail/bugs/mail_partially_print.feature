Feature: Mail Partially Printed Bugs

  Background:
    Given a valid user is signed in to Web Apps

  @mail_partially_printed_bug_ordersauto_3349

  Scenario: ORDERSAUTO-3349 Legacy WEBAPPS-7032 Thermal Label only partially printed if printed directly after 8 1/2 x 11 Shipping Label print with Receipt

    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then show Advanced Options
    Then check Advanced Options Hide Label Value
    Then select Print On Envelope - 10
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    #mail_print_roll_4x6_fcm_large_envelope
    Then select Print On Roll 4x6
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then Print Postage
    Then click Mail Print modal Print button

    Then Sign out
