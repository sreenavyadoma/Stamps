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
    Then sign-in to Mail
    Then select print on Stamps

    #Then check Shipping Label - 8 ½" x 11" Paper in Manage Print Options
    # Then click save on Manage Print Options

#    Then show advanced options
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
#    Then select print form service FCM Letter
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
    Then select print on Stamps
    Then show advanced options
    Then set Print form Serial Number to B12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then select print form service Media Mail
    Then set Print form Amount to 2
    Then set Print form Quantity to 1
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then Sign out

  @rob_cccc
  Scenario: Address Cleansing
    Then sign-in to Mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    #Then set Print form Mail-From to Automation - El Segundo, CA
#    Then set Print form Mail-From to Manage Mailing Addresses...
    Then set print form mail-to country to United States
    Then set print form mail-to country to Brazil
    Then set print form mail-to country to United States
    Then set print form mail-to country to Japan
    Then set print form mail-to country to United States
    Then set print form mail-to to address to Address Cleansing, BVT, 1350 Market Street #2905, San Francisco, CA
#    Then set print form ounces to 1
#    Then select print form service PM Package
#    Then expect Print form Domestic Address field displays Address Cleansing, BVT, 1350 Market Street, San Francisco, CA 94102-5401
    Then Sign out

  @mail_print_on_lov
  Scenario: Print-on list of values
    Then sign-in to Mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select print form service PM Package
    Then select print form service PM Flat Rate Envelope
    Then select print form service PM Medium Flat Rate Box

    Then select print on Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then select print on Envelope - #10, 4 ⅛" x 9 ½"
    Then select print on Envelope - #9, 3 ⅞" x 8 ⅞"
    Then select print on Envelope - #A9, 5 ¾" x 8 ¾"
    Then select print on Envelope - #6, 3 ⅝" x 6 ½"
    Then select print on Envelope - #A2, 4 ⅜" x 5 ¾"
    Then select print on Envelope - #7, 3 ⅞" x 7 ½"
    Then select print on Envelope - #11, 4 ½" x 10 ⅜"
    Then select print on Envelope - #12, 4 ¾" x 11"
    Then select print on Certified Mail Label - SDC-3610
    Then select print on Certified Mail Label - SDC-3710
    Then select print on Certified Mail Label - SDC-3910
    Then select print on Certified Mail Label - SDC-3930
    Then select print on Certified Mail #11 Envelope - SDC-3810
    Then select print on Roll - 4" x 6" Shipping Label
    Then select print on Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then select print on Stamps
    Then select print on Manage Printing Options...

  @rob_test
  Scenario: Advanced Options for Envelope - 10
    Then sign-in to Mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    #Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1
    Then select print form service PM Package
#    Then set print form pounds to 0
#    Then set print form ounces to 1

    Then show advanced options
    Then hide advanced options
    Then show advanced options
    #Then expect Advanced Options Extra Services Button is visible

    Then set mail ship date to 05/31/2018
    Then open mail ship date picker
    Then click today on mail ship date picker
    Then click mail ship date picker today plus 0
    Then click mail ship date picker today plus 1
    Then click mail ship date picker today plus 2
    Then click mail ship date picker today plus 3
    Then click mail ship date picker today plus 4
    Then click mail ship date picker today plus 5


#    Then set Advanced Options Mail Date to today
#    Then expect Advanced Options Mail Date field is present
#    Then set Advanced Options Mail Date to date 04/04/2017
#    Then expect Advanced Options Mail Date is 04/04/2017
#    Then set Advanced Options Mail Date to today
#    Then expect Advanced Options Mail Date is correct
#    Then set Advanced Options Mail Date to tomorrow
#    Then expect Advanced Options Mail Date is correct
#    Then set Advanced Options Mail Date to today plus 0
#    Then expect Advanced Options Mail Date is correct
#    Then set Advanced Options Mail Date to today plus 1
#    Then expect Advanced Options Mail Date is correct
#    Then set Advanced Options Mail Date to today plus 2
#    Then expect Advanced Options Mail Date is correct
#    Then set Advanced Options Mail Date to today plus 3
#    Then expect Advanced Options Mail Date is correct
#    Then set Advanced Options Mail Date to today plus 4
#    Then expect Advanced Options Mail Date is correct
#    Then set Advanced Options Mail Date to today plus 5
#    Then expect Advanced Options Mail Date is correct
#
#    Then expect Advanced Options include Return Address is present
#    Then check Advanced Options include Return Address
#    Then expect Advanced Options include Return Address is checked
#    Then uncheck Advanced Options include Return Address
#    Then expect Advanced Options include Return Address is unchecked
#
#    Then expect Advanced Options include Delivery Address is present
#    Then check Advanced Options include Delivery Address
#    Then expect Advanced Options include Delivery Address is checked
#    Then uncheck Advanced Options include Delivery Address
#    Then expect Advanced Options include Delivery Address is unchecked
#
#    Then expect Advanced Options include Postage is present
#    Then check Advanced Options include Postage
#    Then expect Advanced Options include Postage is checked
#    Then uncheck Advanced Options include Postage
#    Then expect Advanced Options include Postage is unchecked
#
#    Then expect Advanced Options Reference Number field is present
#    Then set Advanced Options Reference Number to random string
#    Then expect Advanced Options Reference Number is correct
#
#    Then expect Advanced Options Cost Code Field is present
#    Then set Advanced Options Cost Code to None
#    Then expect Advanced Options Cost Code is None
