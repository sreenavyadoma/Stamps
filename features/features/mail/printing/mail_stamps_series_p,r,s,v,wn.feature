
@mail_stamps_series_p_r_s_v_wn
Feature: Stamps Series #P, #R, #S, #V, #WN

  Background:
    Given a valid user is signed in to Web Apps
  @mail_stamps_series_r
  Scenario: Stamps Regression Series #R
    #mail_print_stamps_r_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to R12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then click Mail Print modal Print button

   #mail_print_stamps_r_series_specify
    Then select Print On Stamps
    Then set Print form Serial Number to R12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Print form Amount to 0.15
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then click Mail Print modal Print button
    Then Sign out

  @mail_stamps_series_s
  Scenario: Stamps Regression Series #S
    #mail_print_stamps_s_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to S12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then click Mail Print modal Print button

   #mail_print_stamps_s_series_specify
    Then select Print On Stamps
    Then set Print form Serial Number to S12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Print form Amount to 0.15
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then click Mail Print modal Print button
    Then Sign out

  @mail_stamps_series_p
  Scenario: Stamps Regression Series #P
   #mail_print_stamps_p_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to P12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then click Mail Print modal Print button

   #mail_print_stamps_p_series_specify
    Then select Print On Stamps
    Then set Print form Serial Number to P12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Print form Amount to 0.15
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then click Mail Print modal Print button
    Then Sign out

  @mail_stamps_series_wn
  Scenario: Stamps Regression Series #WN
    #mail_print_stamps_wn_series_specify
    Then select Print On Stamps
    Then set Print form Serial Number to WN1234
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service First Class
    Then set Print form Amount to 0.15
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then click Mail Print modal Print button

   #mail_print_stamps_wn_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to WN1234
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then click Mail Print modal Print button
    Then Sign out

  @mail_stamps_series_v
  Scenario: Stamps Regression Series #V
   #mail_print_stamps_v_series_calculate
    Then select Print On Stamps
    Then set Print form Serial Number to V12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then click Mail Print modal Print button

   #mail_print_stamps_v_series_specify
    Then select Print On Stamps
    Then set Print form Serial Number to V12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service Media Mail
    Then set Print form Amount to 0.15
    Then set Advanced Options Cost Code to None
    Then Print Postage
    Then click Mail Print modal Print button
    Then Sign out
