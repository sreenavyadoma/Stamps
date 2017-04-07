Feature: Advanced Options BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_advanced_options
  Scenario: Advanced Options BVT

    # ------------------------------------------------------------ Stamps Advanced Options
    Then select Print On Stamps
    Then show Advanced Options

    Then expect Advanced Options Extra Services Button is visible
    Then expect Advanced Options Calculate Postage Amount radio button is present
    Then select Advanced Options Calculate Postage Amount
    Then expect Advanced Options Calculate Postage Amount is selected
    Then expect Advanced Options Specify Postage Amount radio button is present
    Then select Advanced Options Specify Postage Amount
    Then expect Advanced Options Specify Postage Amount is selected
    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    # Populate Stamps form
    Then set Print form Serial Number to random C series
    Then select Advanced Options Specify Postage Amount
    Then set Print form Mail-From to default
    Then select Print form service Media Mail
    Then set Print form Amount to 2.85
    Then set Print form Quantity to 1

    # Extra Services
    Then expect Advanced Options Extra Services Button is visible
    Then select Advanced Options Extra Services
    Then expect Extra Services is present
    Then close Extra Services

    # Reference Number Textbox
    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    # Cost Code Textbox
    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Rolls Advanced Options
    Then select Print On Roll - 4" x 6" Shipping Label

    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1
    Then select Print form service PM Package
    Then show Advanced Options

    # Extra Services
    Then expect Advanced Options Extra Services Button is visible
    Then select Advanced Options Extra Services
    Then expect Extra Services is present
    Then close Extra Services

    # Mail Date Picker
    Then expect Advanced Options Mail Date field is present
    Then set Advanced Options Mail Date to date 04/04/2017
    Then expect Advanced Options Mail Date is 04/04/2017
    Then set Advanced Options Mail Date to today
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to tomorrow
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

    # Hide Label Value Checkbox
    Then expect Advanced Options Hide Label Value is present
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then uncheck Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is unchecked

    # Reference # Checkbox
    Then expect Advanced Options Print Reference # is present
    Then check Advanced Options Print Reference #
    Then expect Advanced Options Print Reference # is checked
    Then uncheck Advanced Options Print Reference #
    Then expect Advanced Options Print Reference # is unchecked

    # Reference Number Textbox
    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    # Cost Code Textbox
    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Shipping Labels Advanced Options
    Then select Print On Shipping Label - 8 ½" x 11" Paper

    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1
    Then select Print form service PM Package
    Then show Advanced Options

    # Extra Services
    Then expect Advanced Options Extra Services Button is visible
    Then select Advanced Options Extra Services
    Then expect Extra Services is present
    Then close Extra Services

    # Mail Date Picker
    Then expect Advanced Options Mail Date field is present
    Then set Advanced Options Mail Date to date 04/04/2017
    Then expect Advanced Options Mail Date is 04/04/2017
    Then set Advanced Options Mail Date to today
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to tomorrow
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

    # Hide Label Value Checkbox
    Then expect Advanced Options Hide Label Value is present
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then uncheck Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is unchecked

    # Print Receipt Checkbox
    Then expect Advanced Options Print Receipt is present
    Then check Advanced Options Print Receipt
    Then expect Advanced Options Print Receipt is checked
    Then uncheck Advanced Options Print Receipt
    Then expect Advanced Options Print Receipt is unchecked

    # Reference # Checkbox
    Then expect Advanced Options Print Reference # is present
    Then check Advanced Options Print Reference #
    Then expect Advanced Options Print Reference # is checked
    Then uncheck Advanced Options Print Reference #
    Then expect Advanced Options Print Reference # is unchecked

    # Reference Number Textbox
    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    # Cost Code Textbox
    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    # ------------------------------------------------------------ Envelopes Advanced Options
    Then select Print On Envelope - #10, 4 ⅛" x 9 ½"

    # Populate Envelope form
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 2
    Then select Print form service FCM Letter

    Then show Advanced Options

    # Extra Services
    Then expect Advanced Options Extra Services Button is visible
    Then select Advanced Options Extra Services
    Then expect Extra Services is present
    Then close Extra Services

    # Mail Date Picker
    Then expect Advanced Options Mail Date field is present
    Then set Advanced Options Mail Date to date 04/04/2017
    Then expect Advanced Options Mail Date is 04/04/2017
    Then set Advanced Options Mail Date to today
    Then expect Advanced Options Mail Date is correct
    Then set Advanced Options Mail Date to tomorrow
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

    # include Return Address Checkbox
    Then expect Advanced Options include Return Address is present
    Then check Advanced Options include Return Address
    Then expect Advanced Options include Return Address is checked
    Then uncheck Advanced Options include Return Address
    Then expect Advanced Options include Return Address is unchecked

    # include Delivery Address Checkbox
    Then expect Advanced Options include Delivery Address is present
    Then check Advanced Options include Delivery Address
    Then expect Advanced Options include Delivery Address is checked
    Then uncheck Advanced Options include Delivery Address
    Then expect Advanced Options include Delivery Address is unchecked

    # include Postage Checkbox
    Then expect Advanced Options include Postage is present
    Then check Advanced Options include Postage
    Then expect Advanced Options include Postage is checked
    Then uncheck Advanced Options include Postage
    Then expect Advanced Options include Postage is unchecked

    # Reference Number Textbox
    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    # Cost Code Textbox
    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None

    Then Sign out
