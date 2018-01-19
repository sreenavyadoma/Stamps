
@mail_print_by_split_button
Feature: New Sprint 12/6/17 WEBAPPS-6803 Add Print Split button to Mail Page. Print Stamps, Labels, Envelopes, Certified Mails using split button

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label
  Scenario: Shipping Label using split button

    #mail_print_shipping_label_5x8_fcm_large_envelope
    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then Print label using split button
    Then Expect mail Print modal is present
    Then close mail Print modal

    Then Sign out

  @mail_print_envelope_6
  Scenario: Print On: Envelope #6

    Then select Print On Envelope - 6
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print postage using split button
    Then Expect mail Print modal is present
    Then close mail Print modal


  Scenario: Print On: Envelope #11

    Then select Print On Envelope - 11
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print postage using split button
    Then Expect mail Print modal is present
    Then close mail Print modal

    Then Sign out


  @mail_print_SDC_3930
  Scenario: Print SDC 3930 (with hidden postage)

    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then Print postage using split button
    Then Expect mail Print modal is present
    Then close mail Print modal

    Then Sign out


  @mail_print_roll_4_1_8_x_6_1_4_fcm
  Scenario: Print on: Roll - 4 ⅛” x 6 ¼” - FCM

  #mail_print_roll_4_1_8_x_6_1_4_fcm_large_envelope
    Then select Print On Roll 418x614
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then Print postage using split button
    Then Expect mail Print modal is present
    Then close mail Print modal


   #mail_print_roll_4x6_fcm_large_envelope
    Then select Print On Roll 4x6
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then Print postage using split button
    Then Expect mail Print modal is present
    Then close mail Print modal

    Then Sign out


  @mail_stamps_series_b
  Scenario: Stamps Regression Series #B
   #mail_print_stamps_b_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to B12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then set Advanced Options Cost Code to None
    Then Print postage using split button
    Then Expect mail Print modal is present
    Then close mail Print modal


   #mail_print_stamps_b_series_specify
    Then select Print On Stamps
    Then set Print form Serial Number to B12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Print form Amount to 0.15
    Then set Advanced Options Cost Code to None
    Then Print postage using split button
    Then Expect mail Print modal is present
    Then close mail Print modal

    Then Sign out
