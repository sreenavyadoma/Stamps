Feature:  Mail BVT - Authentication

  Background:
    Given Start test driver

  @mail_authentication
  Scenario: Mail - Authentication
    Then sign-in to Mail
    Then sign-out of SDC Website
    Then visit Mail
    Then open sign in modal in Mail
    Then set Mail username
    Then set Mail password
    Then check Remember Username
    Then uncheck Remember Username
    Then check Remember Username
    Then click the Sign In button in Mail
    Then expect user is signed in
    Then sign-out of SDC Website
    Then visit Mail
    Then open sign in modal in Mail
    Then expect username is present in Mail username field
    Then expect Remember Username is checked
    Then visit Mail
    Then open sign in modal in Mail
    Then set Mail username
    Then click the Sign In button in Mail
    Then expect Mail Sign In Modal error Your username or password is invalid.

    # ------------------------------------------------------------ Stamps Advanced Options
  @mail_bvt_advanced_options
  @mail_advanced_options_stamps
  Scenario: Advanced Options for Stamps
    #Then sign-in to Mail
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
    Then select Print On Manage Printing Options...

    #Then check Shipping Label - 8 ½" x 11" Paper in Manage Print Options
    # Then click save on Manage Print Options

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
#    Then set print form mail-to Country to United States
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


  @bvt_mail_piece_validation
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

  @rob_test
  Scenario: Address Cleansing
    Then sign-in to Mail
    Then select Print On Shipping Label - 8 ½" x 11" Paper
#    Then set Print form Mail-From to Automation - El Segundo, CA
#    Then set print form mail-to country to United States
    Then set print form mail-to to address to Address Cleansing, BVT, 1350 Market Street #2905, San Francisco, CA
#    Then set Print form Ounces to 1
#    Then select Print form service PM Package
#    Then expect Print form Domestic Address field displays Address Cleansing, BVT, 1350 Market Street, San Francisco, CA 94102-5401
#    Then Sign out


