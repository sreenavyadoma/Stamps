Feature:  Mail BVT - Authentication

  Background:
    Given Start test driver

  @mail_bvt_international
  Scenario: International Shipping
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    #Then set Print form Mail-From to default
    Then show advanced options
    #Then set Advanced Options Mail Date to today
    Then set print form ship-to to international address
      | name   | company | street_address_1 | street_address_2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button

    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Document
#Then set customs more info to some random string
    Then set customs package contents to Commercial Sample
    Then expect customs package contents is Commercial Sample
    Then set customs license number to a random string
    Then expect customs license number is correct
    Then set customs certificate number to some random string
    Then expect customs certificate number is correct
    Then set customs invoice number to a random string
    Then expect customs invoice number is correct

    Then set customs non-delivery options to Treat as abandoned
    Then expect customs non-delivery options is Treat as abandoned

    Then set customs internal transaction number to Required
    Then expect customs internal transaction number is Required

    Then set customs itn number to ITN123

    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 2, description Item 2, qty 2, Price 2, Made In Japan, Tariff 2
    Then add customs associated item 3, description Random String, qty 3, Price 3, Made In Canada, Tariff 3

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form

    Then click print form edit customs form button
    Then pause for 1 second
    Then expect customs package contents is Commercial Sample
    Then expect customs license number is correct
    Then expect customs certificate number is correct
    Then expect customs invoice number is correct

    Then expect customs non-delivery options is Treat as abandoned
    Then expect customs internal transaction number is Required
    Then expect customs i agree to the usps privacy act statement is checked correct

    Then expect customs associated item 1 Description is correct
    Then expect customs associated item 1 Quantity is correct
    Then expect customs associated item 1 Unit Price is correct
    Then expect customs associated item 1 Made In is correct
    Then expect customs associated item 1 Tariff is correct

    Then expect customs associated item 2 Description is correct
    Then expect customs associated item 2 Quantity is correct
    Then expect customs associated item 2 Unit Price is correct
    Then expect customs associated item 2 Made In is correct

    Then expect customs associated item 3 Description is correct
    Then expect customs associated item 3 Quantity is correct
    Then expect customs associated item 3 Unit Price is correct
    Then expect customs associated item 3 Made In is correct
    Then expect customs associated item 3 Tariff is correct

    Then expect customs i agree to the usps privacy act statement is checked
    Then expect Customs Total Value is correct
    Then close customs information form

  @mail_authentication
  Scenario: Mail - Authentication
    Then sign-in to mail
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
    Then sign-in to mail
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
#    Then set print form serial number to random C series
#    Then select Advanced Options Calculate Postage Amount
#    Then set Print form Mail-From to default
#    Then set print form mail-to country to United States
#    Then select print form service FCM Letter
#    Then set Print form Quantity to 1
#    Then set advanced options cost code to None
#
#    Then expect Advanced Options Extra Services Button is visible
#
#    Then expect advanced options reference number field is present
#    Then set advanced options reference number to random string
#    Then expect advanced options reference number is correct
#
#    Then expect advanced options cost code field is present
#    Then set advanced options cost code to None
#    Then expect advanced options cost code is None


  @bvt_mail_piece_validation
  Scenario: Stamps B-Series
    Then select print on Stamps
    Then show advanced options
    Then set print form serial number to B12345
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
    Then sign-in to mail
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

  @sdc_mail_bvt_stamps
  Scenario: Mail BVT-Stamps
    Then sign-in to Mail
    Then select print on Stamps

    Then set Print form Serial Number to C12345
    Then select Advanced Options Specify Postage Amount
    #Then set Print form Mail-From to default
    Then select print form service Media Mail
    Then set Print form Amount to 2.85
    Then set Print form Quantity to 1
    #Then set Advanced Options Reference Number to Stamp3221
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then set Print form Serial Number to B12345
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set print form ounces to 1
    Then select print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then sign out

  @mail_print_on_lov
  Scenario: Print-on list of values
    Then sign-in to mail
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
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    #Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 8
    Then select print form service PM Package
    Then set print form weight to lbs 1 oz 1
    Then set print form dimensions to length 2 width 2 height 2

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
#    Then expect advanced options reference number field is present
#    Then set advanced options reference number to random string
#    Then expect advanced options reference number is correct
#
#    Then expect advanced options cost code field is present
#    Then set advanced options cost code to None
#    Then expect advanced options cost code is None

  @mail_bvt_ui_validation
  Scenario: BVT Mail UI Validation for Print On options
    Then sign-in to mail

#    STAMPS
    Then select print on Stamps
    Then set print form serial number to random
    Then blur out on print form
    Then select print form specify postage amount
#    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then select print form service First Class
    Then select print form service Media Mail
    Then set print form stamp amount 1.23
    Then hide advanced options
    Then show advanced options
    Then select print form calculate postage amount
    Then increment print form weight by lbs 2 oz 2
    Then decrement print form weight by lbs 2 oz 2
    Then set print form weight to lbs 0 oz 1
    Then select print form service FCM Postcard
    Then select print form service FCM Letter
    Then select print form service FCM Large Envelope/Flat
    Then select print form service MM Package/Flat/Thick Envelope
    Then set print form reference number STMP123
    Then set print form cost code None
    Then set print form stamp quantity 3
    Then increment print form stamp quantity by 2
    Then decrement print form stamp quantity by 2
    Then check print form print all
    Then uncheck print form print all

#    PRINT ON MEDIA
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
    Then select print on Certified Mail #11 Envelope - SDC-3830
    Then select print on Roll - 4" x 6" Shipping Label
    Then select print on Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then select print on Shipping Label - 8 ½" x 11" Paper

#   PRINT SERVICE
    #Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 8
    Then check print form email tracking
    Then set print form email tracking stamps@mailinator.com
    Then select print form service FCM Large Envelope/Flat
    Then select print form service FCM Package/Thick Envelope
    Then select print form service PM Large/Thick Envelope
    Then select print form service PM Large Package
    Then select print form service PM Flat Rate Envelope
    Then select print form service PM Padded Flat Rate Envelope
    Then select print form service PM Legal Flat Rate Envelope
    Then select print form service PM Small Flat Rate Box
    Then select print form service PM Medium Flat Rate Box
    Then select print form service PM Large Flat Rate Box
    Then select print form service PM Regional Rate Box A
    Then select print form service PM Regional Rate Box B
    Then select print form service PME Package/Flat/Thick Envelope
    Then select print form service PME Flat Rate Envelope
    Then select print form service PME Padded Flat Rate Envelope
    Then select print form service PME Legal Flat Rate Envelope
    Then select print form service MM Package/Flat/Thick Envelope
    Then select print form service PSG Package/Flat/Thick Envelope
    Then select print form service PSG Large Package
    Then select print form service PSG Oversized Package
    Then select print form service PM Package
    Then set print form weight to lbs 1 oz 1
    Then increment print form dimensions by length 2 width 2 height 2
    Then decrement print form dimensions by length 2 width 2 height 2
    Then set print form dimensions to length 2 width 2 height 2
    Then set print form tracking Signature Required
    Then set print form tracking USPS Tracking

#    EXTRA SERVICES
    Then select advanced options extra services
    Then check extra services fragile
    Then uncheck extra services fragile
    Then check extra services return receipt for merchandise
    Then expect value must be shown modal is present
    Then click value must be shown window continue button
    Then click extra services form 3811
    Then close form 3811 modal
    Then uncheck extra services return receipt for merchandise
    Then check extra services non-rectangular
    Then uncheck extra services non-rectangular
    Then check extra services hold for pickup
    Then uncheck extra services hold for pickup
    Then set extra services security to USPS Insurance
    Then set extra services security to Registered Mail
    Then increment extra services security value by 2
    Then decrement extra services security value by 2
    Then set extra services security value to 3
    Then set extra services security value to 0
    Then check extra services return receipt
    Then uncheck extra services return receipt
    Then check extra services restricted delivery
    Then uncheck extra services restricted delivery
    Then increment extra services cod by 2
    Then decrement extra services cod by 2
    Then set extra services cod to 3
    Then pause for 15 second
    Then check extra services notice of non-delivery
    Then uncheck extra services notice of non-delivery
    Then set extra services cod to 0
    Then blur out on extra services form
    Then set extra services handling to Hazardous Materials
    Then click special contents warning modal i agree
    Then set extra services handling to Live Animal
    Then click special contents warning modal i agree
    Then set extra services handling to Live Animal (with Fee)
    Then click special contents warning modal i agree
    Then set extra services handling to Normal
    Then close extra services

#    ADVANCED OPTIONS
    Then uncheck advanced options hide label value
    Then check advanced options hide label value
    Then check advanced options print receipt
    Then uncheck advanced options print receipt
    Then check advanced options print reference #
    Then uncheck advanced options print reference #

    Then sign out

  @mail_bvt_ship_date
  Scenario: Change Ship Date and Postdate Time
    Then sign-in to mail
    Then open mail settings modal
    Then set mail settings postdate to now +2 hours
    Then close mail settings modal
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to address to Address Cleansing, BVT, 1350 Market Street #2905, San Francisco, CA
    Then set print form ounces to 4
    Then select print form service PM Flat Rate Envelope
    Then expect print form ship date is 0 days from today
    Then open mail settings modal
    Then set mail settings postdate to now -2 hours
    Then close mail settings modal
    Then expect settings link is present in notification bar
    Then set print form mail-to to a random address in zone 1
    Then set print form ounces to 2
    Then select print form service PM Padded Flat Rate Envelope
    Then expect print form ship date is 1 days from today
    Then open mail settings modal
    Then set mail settings postdate to now +2 hours
    Then close mail settings modal
    Then set print form ounces to 3
    Then select print form service PM Legal Flat Rate Envelope
    Then expect print form ship date is 0 days from today
    Then set print form ship date to today
    Then expect print form ship date is 0 days from today
    Then set print form ship date to today plus 1
    Then expect print form ship date is 1 day from today
    Then set print form ship date to today plus 2
    Then expect print form ship date is 2 days from today
    Then set print form ship date to today
    Then expect print form ship date is 0 days from today

    Then open mail settings modal
    Then set mail settings postdate to 5:00 p.m.
    Then close mail settings modal
    Then sign out