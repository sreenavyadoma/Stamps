Feature: BVT for Mail page
  Background:
    Given a valid user is signed in to Web Apps

  #@mail_authentication
  #Scenario: Mail Authentication Test
  #  Then sign out

  @mail_bvt_address_cleansing
  Scenario: Address Cleansing
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to address to Address Cleansing, BVT, 1350 Market Street, San Francisco, CA
    Then set print form ounces to 1
    Then select print form service PM Package
    Then expect Print form Domestic Address field displays Address Cleansing, BVT, 1350 Market Street, San Francisco, CA 94102-5401
    Then sign out


    # ------------------------------------------------------------ Rolls Advanced Options
  @mail_bvt_advanced_options
  @mail_advanced_options__rolls
  Scenario: Advanced Options for Roll 4x6
    Then select print on Roll 4x6
    Then set Advanced Options Mail Date to today
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1
    Then select print form service PM Package
    Then show advanced options
    Then expect Advanced Options Extra Services Button is visible

    Then expect Advanced Options Mail Date field is present
    Then set Advanced Options Mail Date to date 04/04/2017
    Then expect Advanced Options Mail Date is 04/04/2017
    Then set Advanced Options Mail Date to today
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to tomorrow
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 0
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 1
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 2
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 3
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 4
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 5
    Then expect Advanced Options Mail Date is correct

    Then expect Advanced Options Hide Label Value is present
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then uncheck Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is unchecked

    Then expect Advanced Options Print Reference # is present
    Then check Advanced Options Print Reference #
    Then expect Advanced Options Print Reference # is checked
    Then uncheck Advanced Options Print Reference #
    Then expect Advanced Options Print Reference # is unchecked

    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Envelopes Advanced Options
  @mail_bvt_advanced_options
  @mail_advanced_options_envelope
  Scenario: Advanced Options for Envelope - 10
    Then select print on Envelope - 10
    Then set Advanced Options Mail Date to today
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 2
    Then select print form service FCM Letter
    Then show advanced options
    Then expect Advanced Options Extra Services Button is visible

    Then expect Advanced Options Mail Date field is present
    Then set Advanced Options Mail Date to date 04/04/2017
    Then expect Advanced Options Mail Date is 04/04/2017
    Then set Advanced Options Mail Date to today
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to tomorrow
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 0
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 1
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 2
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 3
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 4
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 5
    Then expect Advanced Options Mail Date is correct

    Then expect Advanced Options include Return Address is present
    Then check Advanced Options include Return Address
    Then expect Advanced Options include Return Address is checked
    Then uncheck Advanced Options include Return Address
    Then expect Advanced Options include Return Address is unchecked

    Then expect Advanced Options include Delivery Address is present
    Then check Advanced Options include Delivery Address
    Then expect Advanced Options include Delivery Address is checked
    Then uncheck Advanced Options include Delivery Address
    Then expect Advanced Options include Delivery Address is unchecked

    Then expect Advanced Options include Postage is present
    Then check Advanced Options include Postage
    Then expect Advanced Options include Postage is checked
    Then uncheck Advanced Options include Postage
    Then expect Advanced Options include Postage is unchecked

    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3710
  @mail_bvt_advanced_options
  @mail_advanced_options_cm3710
  Scenario: Advanced Options for Certified Mail Label - SDC-3710
    Then select print on Certified Mail Label - SDC-3710

    Then show advanced options

    Then expect Print Form Certified Mail is checked
    Then expect Print Form Certified Mail is visible
    Then expect Print Form Certified Mail is disabled

    Then expect Print Form Return Receipt is not visible

    Then expect Print Form Electronic Return Receipt is present
    Then check Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is checked
    Then uncheck Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is unchecked

    Then expect Advanced Options Restricted Delivery is present
    Then check Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is checked
    Then uncheck Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is unchecked

    Then expect Advanced Options Mail Date field is present

    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3610
  @mail_bvt_advanced_options
  @mail_advanced_options_cm3610
  Scenario: Advanced Options for Certified Mail Label - SDC-3610
    Then select print on Certified Mail Label - SDC-3610

    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1
    Then select print form service PM Package

    Then show advanced options

    Then expect Print Form Certified Mail is checked
    Then expect Print Form Certified Mail is visible
    Then expect Print Form Certified Mail is disabled

    Then expect Print Form Return Receipt is not visible

    Then expect Print Form Electronic Return Receipt is present
    Then check Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is checked
    Then uncheck Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is unchecked

    Then expect Advanced Options Restricted Delivery is present
    Then check Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is checked
    Then uncheck Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is unchecked

    Then expect Advanced Options Mail Date field is present

    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3910
  @mail_bvt_advanced_options
  @mail_advanced_options_cm3910
  Scenario: Advanced Options for Certified Mail Label - SDC-3910
    Then select print on Certified Mail Label - SDC-3910

    Then expect Print Form Certified Mail is checked
    Then expect Print Form Certified Mail is visible
    Then expect Print Form Certified Mail is disabled

    Then expect Print Form Return Receipt is present
    Then check Print Form Return Receipt
    Then expect Print Form Return Receipt is checked
    Then uncheck Print Form Return Receipt
    Then expect Print Form Return Receipt is unchecked

    Then expect Print Form Electronic Return Receipt is present
    Then check Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is checked
    Then uncheck Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is unchecked

    Then expect Advanced Options Restricted Delivery is present
    Then check Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is checked
    Then uncheck Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is unchecked

    Then expect Advanced Options Mail Date field is present

    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3930
  @mail_bvt_advanced_options
  @mail_advanced_options_3930
  Scenario: Advanced Options for Certified Mail Label - SDC-3930
    Then select print on Certified Mail Label - SDC-3930

    Then expect Print Form Certified Mail is checked
    Then expect Print Form Certified Mail is visible
    Then expect Print Form Certified Mail is disabled

    Then expect Print Form Return Receipt is present
    Then check Print Form Return Receipt
    Then expect Print Form Return Receipt is checked
    Then uncheck Print Form Return Receipt
    Then expect Print Form Return Receipt is unchecked

    Then expect Print Form Electronic Return Receipt is present
    Then check Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is checked
    Then uncheck Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is unchecked

    Then expect Advanced Options Restricted Delivery is present
    Then check Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is checked
    Then uncheck Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is unchecked

    Then expect Advanced Options Mail Date field is present

    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Certified Mail Advanced Options SDC-3810
  @mail_bvt_advanced_options
  @mail_advanced_options_3810
  Scenario: Advanced Options for Certified Mail Label - SDC-3810
    Then select print on Certified Mail Label - SDC-3810

    Then expect Print Form Certified Mail is checked
    Then expect Print Form Certified Mail is visible
    Then expect Print Form Certified Mail is disabled

    Then expect Print Form Return Receipt is visible
    Then expect Print Form Return Receipt is disabled
    Then expect Print Form Return Receipt is checked

    Then expect Print Form Electronic Return Receipt is present
    Then check Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is checked
    Then uncheck Print Form Electronic Return Receipt
    Then expect Print Form Electronic Return Receipt is unchecked

    Then expect Advanced Options Restricted Delivery is present
    Then check Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is checked
    Then uncheck Advanced Options Restricted Delivery
    Then expect Advanced Options Restricted Delivery is unchecked

    Then expect Advanced Options Mail Date field is present

    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Shipping Labels Advanced Options
  @mail_bvt_advanced_options
  @mail_advanced_options_paper
  Scenario: Advanced Options for Shipping Label - 8 ½" x 11" Paper
    Then select print on Shipping Label - 8 ½" x 11" Paper

    Then set Advanced Options Mail Date to today
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1
    Then select print form service PM Package
    Then show advanced options

    Then expect Advanced Options Extra Services Button is visible

    Then expect Advanced Options Mail Date field is present
    Then set Advanced Options Mail Date to today
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to tomorrow
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 0
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 1
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 2
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 3
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 4
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to today plus 5
    Then expect Advanced Options Mail Date is correct

    Then expect Advanced Options Hide Label Value is present
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then uncheck Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is unchecked

    Then expect Advanced Options Print Receipt is present
    Then check Advanced Options Print Receipt
    Then expect Advanced Options Print Receipt is checked
    Then uncheck Advanced Options Print Receipt
    Then expect Advanced Options Print Receipt is unchecked

    Then expect Advanced Options Print Reference # is present
    Then check Advanced Options Print Reference #
    Then expect Advanced Options Print Reference # is checked
    Then uncheck Advanced Options Print Reference #
    Then expect Advanced Options Print Reference # is unchecked

    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    Then sign out

  @mail_bvt_contacts
  Scenario: Contacts

    Then select print on Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then click Print form Mail To link
    Then click Search Contacts close button
    Then sign out

  @mobile_mail_smoke_test
  @mail_bvt_envelopes
  Scenario: Envelope
    Then select print on Envelope - 10
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1
    Then set print form ounces to 1
    Then select print form service FCM Letter
  #Then expect Print Form service cost for FCM Letter is N/A
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @mail_bvt_extra_services
  Scenario: Extra Services
    Then select print on Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to address random name, random company, 3217 Shasta Circle S., Los Angeles, CA 90065
    Then set print form ounces to 1
    Then select print form service PM Padded Flat Rate Envelope
    Then expect Advanced Options Hide Label Value is checked
    Then select Advanced Options Extra Services

    Then set Extra Services Security to Registered Mail
    Then click value must be shown window Continue button
    Then expect Extra Services Security Price to be 11.90

    Then set Extra Services Value to 30.00
    Then expect Extra Services Security Price to be 12.60

    Then set Extra Services COD to 20.00
    Then expect Extra Services COD Price to be 5.70

    Then check Extra Services Return Receipt
    Then expect Extra Services Return Receipt Price to be 2.75

    Then check Extra Services Restricted Delivery
    Then expect Extra Services Restricted Delivery Price to be 5.10

    Then check Extra Services Notice of Non-Delivery
    Then expect Extra Services Notice of Non-Delivery Price to be 0.00

    Then expect Extra Services Total Price to be 26.15

    Then save Extra Services

    Then select Advanced Options Extra Services

    Then expect Extra Services Security Price to be 12.60
    Then expect Extra Services Return Receipt Price to be 2.75
    Then expect Extra Services Restricted Delivery Price to be 5.10
    Then expect Extra Services COD Price to be 5.70
    Then expect Extra Services Notice of Non-Delivery Price to be 0.00
    Then expect Extra Services Total Price to be 26.15

    Then save Extra Services
    Then sign out

#Then Mail: Print International Postage
    Then sign out

  @bvt_mail_piece_validation
  Scenario: Envelope - #10
    Then select print on Envelope - 10
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1
    Then set print form ounces to 1
    Then select print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @bvt_mail_piece_validation
  Scenario: Shipping Label - 8 ½" x 11" Paper
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @bvt_mail_piece_validation
  Scenario: Roll - 4" x 6" Shipping Label
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Large Flat Rate Box
    Then Print Postage
#    Then set Mail Print modal Printer Zebra LP 2844 on qa-printlab2016
    Then set Mail Print modal Printer ZDesigner LP 2844
    Then click Mail Print modal Print button
    Then sign out

  @bvt_mail_piece_validation
  Scenario: Certified Mail Label - SDC-3610
#    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select print on Certified Mail Label - SDC-3610
    Then set Print form Mail-From to default
#    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Package
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @bvt_mail_piece_validation
  Scenario: Shipping Label - 8 ½" x 11" Paper
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Flat Rate Envelope
    Then show advanced options
    Then check Advanced Options Print Receipt
    Then Print Label
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @mail_bvt_purchasing
  Scenario: Purchasing $10

    Then on add funds modal, purchase 10
    Then on add funds modal, click purchase button
    Then buy mail confirm purchase: expect text area contains, please confirm your $10.00 postage purchase.
    Then buy mail confirm transction: click confirm button
    Then buy mail purchase approved: expect text area contains, your fund request for $10.00 has been approved.
    Then buy mail purchase approved: click ok button
    Then buy mail: expect customer balance increased by $10

    Then sign out

  @mobile_mail_smoke_test
  @mail_bvt_stamps
  Scenario: Print form Specify Postage
    Then select print on Stamps

    Then set Print form Serial Number to C12345
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then select print form service Media Mail
    Then set Print form Amount to 2.85
    Then set Print form Quantity to 1
    Then set Advanced Options Reference Number to Stamp3221
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

  @mail_service_validation
  Scenario: Mail Service Validation
    Then select print on Stamps
    Then select print form service Media Mail
    Then select print form service FCM Letter
    Then select print form service FCM Large Envelope/Flat
    Then sign out

  @mail_service_validation
  Scenario: Mail Service Validation for Stamps
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
    Then sign out

  @mail_service_validation
  Scenario: Envelope - #10
    Then select print on Envelope - 10
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1
    Then set print form ounces to 1
    Then select print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @mail_service_validation
  Scenario: Shipping Label - 8 ½" x 11" Paper
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 5 through 8
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @mail_service_validation
  Scenario: Roll - 4" x 6" Shipping Label
    Then select print on Roll 4x6
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service PM Large Flat Rate Box
    Then Print Postage
    Then set Mail Print modal Printer Zebra LP 2844 on qa-printlab2016
    Then click Mail Print modal Print button
    Then sign out

  @mail_service_validation
  Scenario: Certified Mail Label - SDC-3610
#    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select print on Certified Mail Label - SDC-3610
    Then set Print form Mail-From to default
#    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Package
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

  @mail_service_validation
  Scenario: Shipping Label - 8 ½" x 11" Paper
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form pounds to 0
    Then set print form ounces to 1
    Then select print form service PM Flat Rate Envelope
    Then show advanced options
    Then check Advanced Options Print Receipt
    Then Print Label
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

