Feature:  Mail BVT - Authentication

  Background:
    Given Start test driver

  @mail_authentication
  Scenario: Mail - Authentication
    Then visit Mail
    Then sign-in to Mail using credentials from MySql
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
    Then select Print On Stamps
    Then show Advanced Options
    Then expect Advanced Options Calculate Postage Amount radio button is present
    Then select Advanced Options Calculate Postage Amount
    Then expect Advanced Options Calculate Postage Amount is selected
    Then expect Advanced Options Specify Postage Amount radio button is present
    Then select Advanced Options Specify Postage Amount
    Then expect Advanced Options Specify Postage Amount is selected
    Then set Print form Serial Number to random C series
    Then select Advanced Options Calculate Postage Amount
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then select Print form service FCM Letter
    Then set Print form Quantity to 1
    Then set Advanced Options Cost Code to None

    Then expect Advanced Options Extra Services Button is visible

    Then expect Advanced Options Reference Number field is present
    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct

    Then expect Advanced Options Cost Code Field is present
    Then set Advanced Options Cost Code to None
    Then expect Advanced Options Cost Code is None