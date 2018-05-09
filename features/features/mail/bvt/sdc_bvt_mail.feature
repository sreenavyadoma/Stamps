Feature:  Mail BVT - Authentication

  Background:
    Given Start test driver

  @mail_authentication
  Scenario: Mail - Authentication
    Then sign-in to Mail
    Then sign-out of SDC Website

  @mail_authentication
  Scenario: Mail - Remember Username
    Then fetch user credentials from MySQL
    Then visit Mail
    Then set Mail username
    Then set Mail password
    Then set Remember Username to Checked
    Then click the Sign In button in Mail
    Then expect user is signed in
    Then sign-out of SDC Website
    Then visit Mail
    Then open sign in modal in Mail
    Then expect username is present in Mail username field
    Then expect Remember Username is checked

  @mail_authentication
  Scenario: Mail - Invalid Credentials
    Then fetch user credentials from MySQL
    Then visit Mail
    Then set Mail username
    Then click the Sign In button in Mail
    Then expect Mail Sign In Modal error Your username or password is invalid.


    # ------------------------------------------------------------ Stamps Advanced Options
  @mail_bvt_advanced_options
  @mail_advanced_options_stamps
  Scenario: Advanced Options for Stamps
    Then sign-in to Mail
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then select Print On Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then select Print On Shipping Label - 5 ½" x 8 ½"
    Then select Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then select Print On Envelope - #9, 3 ⅞" x 8 ⅞"
    Then select Print On Envelope - #A9, 5 ¾" x 8 ¾"
    Then select Print On Envelope - #6, 3 ⅝" x 6 ½"
    Then select Print On Envelope - #A2, 4 ⅜" x 5 ¾"
    Then select Print On Envelope - #7, 3 ⅞" x 7 ½"
    Then select Print On Envelope - #11, 4 ½" x 10 ⅜"
    Then select Print On Envelope - #12, 4 ¾" x 11"
    Then select Print On Certified Mail Label - SDC-3610
    Then select Print On Certified Mail Label - SDC-3710
    Then select Print On Certified Mail Label - SDC-3910
    Then select Print On Certified Mail Label - SDC-3930
    Then select Print On Certified Mail #11 Envelope - SDC-3810
    Then select Print On Roll - 4" x 6" Shipping Label
    Then select Print On Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then select Print On Stamps
#    Then show Advanced Options
#    Then expect Advanced Options Calculate Postage Amount radio button is present
#    Then select Advanced Options Calculate Postage Amount
#    Then expect Advanced Options Calculate Postage Amount is selected
#    Then expect Advanced Options Specify Postage Amount radio button is present
#    Then select Advanced Options Specify Postage Amount
#    Then expect Advanced Options Specify Postage Amount is selected
#    Then set Print form Serial Number to random C series
#    Then select Advanced Options Calculate Postage Amount
#    Then set Print form Mail-From to default
#    Then set Print form Mail-To Country to United States
#    Then select Print form service FCM Letter
#    Then set Print form Quantity to 1
#    Then set Advanced Options Cost Code to None
#
#    Then expect Advanced Options Extra Services Button is visible
#
#    Then expect Advanced Options Reference Number field is present
#    Then set Advanced Options Reference Number to random string
#    Then expect Advanced Options Reference Number is correct
#
#    Then expect Advanced Options Cost Code Field is present
#    Then set Advanced Options Cost Code to None
#    Then expect Advanced Options Cost Code is None