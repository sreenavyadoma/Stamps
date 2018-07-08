
@mail_stamps_series_p_r_s_v_wn
Feature: Stamps Series #P, #R, #S, #V, #WN

  Background:
    Given a valid user is signed in to Web Apps
  @mail_stamps_series_r
  Scenario: Stamps Regression Series #R
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to R12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set advanced options cost code to None
    Then click mail statusbar print
    Then pause for 1 second
    Then click Mail Print modal Print button

   #mail_print_stamps_r_series_specify
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to R12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set Print form Amount to 0.15
    Then set advanced options cost code to None
    Then click mail statusbar print
    Then click Mail Print modal Print button
    Then sign out

  @mail_stamps_series_s
  Scenario: Stamps Regression Series #S
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to S12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set advanced options cost code to None
    Then click mail statusbar print
    Then pause for 1 second
    Then click Mail Print modal Print button

   #mail_print_stamps_s_series_specify
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to S12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set Print form Amount to 0.15
    Then set advanced options cost code to None
    Then click mail statusbar print
    Then click Mail Print modal Print button
    Then sign out

  @mail_stamps_series_p
  Scenario: Stamps Regression Series #P
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to P12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set advanced options cost code to None
    Then click mail statusbar print
    Then pause for 1 second
    Then click Mail Print modal Print button

   #mail_print_stamps_p_series_specify
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to P12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set Print form Amount to 0.15
    Then set advanced options cost code to None
    Then click mail statusbar print
    Then click Mail Print modal Print button
    Then sign out

  @mail_stamps_series_wn
  Scenario: Stamps Regression Series #WN
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to WN1234
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then select print form service First Class
    Then set Print form Amount to 0.15
    Then set advanced options cost code to None
    Then click mail statusbar print
    Then pause for 1 second
    Then click Mail Print modal Print button

   #mail_print_stamps_wn_series_calculate
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to WN1234
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set advanced options cost code to None
    Then click mail statusbar print
    Then click Mail Print modal Print button
    Then sign out

  @mail_stamps_series_v
  Scenario: Stamps Regression Series #V
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to V12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set advanced options cost code to None
    Then click mail statusbar print
    Then pause for 1 second
    Then click Mail Print modal Print button

   #mail_print_stamps_v_series_specify
    Then pause for 1 second
    Then select print on Stamps
    Then set print form serial number to V12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then select print form service Media Mail
    Then set Print form Amount to 0.15
    Then set advanced options cost code to None
    Then click mail statusbar print
    Then click Mail Print modal Print button
    Then sign out
