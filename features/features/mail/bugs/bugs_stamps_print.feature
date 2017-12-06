
Feature: Stamps print media bugs

  Background:
    Given a valid user is signed in to Web Apps

  @bugs_stamps_print
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

  @bugs_stamps_print
  Scenario: Web Client L Series NetStamps | Media Mail | Unable To Get Rates

  #mail_print_stamps_l_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to L12345
    Then select Advanced Options Calculate Postage Amount
    Then expect Print form service Media Mail is not present in dropdown list

  @bugs_stamps_print
  Scenario: Web Client ML Series NetStamps | Media Mail | Unable To Get Rates

   #mail_print_stamps_ml_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to ML1234
    Then select Advanced Options Calculate Postage Amount
    Then expect Print form service Media Mail is not present in dropdown list

  @bugs_stamps_print
  Scenario: E-mail field error validation - "Email is required." when printing Envelopes

    Then select Print On Shipping Label - Paper
    Then check Print form Email Tracking checkbox
    Then select Print On Envelope - 10
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then expect mail Print modal is present
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button





