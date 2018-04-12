@sdc_endicia_pp_log_in
Feature: PP-MVP: Login Page

    Background:
        Given Start test driver

    @sdc_endicia_pp_login_page_ui_validation
    Scenario: PP: Login UI Validation
        Then PP: A user navigates to the login page

        #verify all content and fields are present
        Then PP: expect login page welcome content is Welcome to the
        Then PP: expect login page Stamps.com endicia content is Stamps.com and Endicia
        Then PP: expect login page USPS Portal content is USPS Portal
        Then PP: expect login page Email field to exist
        Then PP: expect login page Email field shows placeholder EMAIL
        Then PP: expect login page Password field to exist
        Then PP: expect login page Password field shows placeholder PASSWORD
        Then PP: expect login page Log In button to exist
        Then PP: expect login page Log In button text is Log In
        Then PP: expect login page Forgot Password link exist

        # Validate Single Help block tooltips
        Then PP: User clicks Log In
        Then PP: expect login page email tooltip index 1 to be This field is required.
        Then PP: expect login page Password tooltip index 1 to be This field is required.

        #set negative values for tooltip validation
        Then PP: set login page email to abc
        Then PP: Blur out on Login Page
        Then PP: set login page password to a!
        Then PP: Blur out on Login Page

     # Validate tooltips for various values
        #Validate Email tooltips
        Then PP: expect login page email tooltip count is 1
        Then PP: expect login page email tooltip index 0 to be Valid email address required.

        #Validate Password tooltips
#        Then PP: expect login page password tooltip count is 2
#        Then PP: expect login page password tooltip index 1 to be 8 characters minimum.
#        Then PP: expect login page password tooltip index 2 to be At least 1 number required.
#        Then PP: expect login page password tooltip index 3 to be At least 1 letter required.

    #Valiadate email and password can't be the same
        Then PP: set login page email to abc@stamps.com
        Then PP: set login page password to abc@stamps.com
        Then PP: User clicks Log In
#        Then PP: expect login page password tooltip index 1 to be Cannot match email.

    #validate incorrect email or passowrd message
        Then PP: set login page email to abc@stamps.com
        Then PP: set login page password to abc123
        Then PP: User clicks Log In
        Then PP: expect login page error message to be
          """
          Your email / password is incorrect.
          OR
          Logging in for the first time? Click ”Forgot Password“ below.
          """

    #Validate Forgot Password link directs user to Reset Password Page


     #@sdc_endicia_pp_login_page_user_status_inactive
#    Scenario: PP: User Status is inactive expect unsuccessful login
#        Then PP: Partner user's xyz Status is Inactive
#        Then PP: Partner user's xyz partner account Status is Inactive
#        Then PP: Partner user's xyz partner contract Status is Inactive

#        Then PP: A user navigates to the login page

#        Then PP: set login page email to automation@stamps.com
#        Then PP: set login page password to pass1234
#
#        Then PP: User clicks Log In
#       #Then PP: expect login page error message to be Your account is inactive. Please contact your Partner Manager.

     #@sdc_endicia_pp_login_page_partner_status_inactive
#    Scenario: PP: Partner Account Status is inactive expect unsuccessful login
#        Then PP: Partner user's xyz Status is Active
#        Then PP: Partner user's xyz partner account Status is Inactive
#        Then PP: Partner user's xyz partner contract Status is Active

#        Then PP: A user navigates to the login page

#        Then PP: set login page email to automation@stamps.com
#        Then PP: set login page password to pass1234
#
#        Then PP: User clicks Log In
#       #Then PP: expect login page error message to be Your account is inactive. Please contact your Partner Manager.

     #@sdc_endicia_pp_login_page_contract_status_inactive
#    Scenario: PP: Partner Contract Status is inactive expect unsuccessful login
#        Then PP: Partner user's xyz Status is Active
#        Then PP: Partner user's xyz partner account Status is Active
#        Then PP: Partner user's xyz partner contract Status is Inactive
#
#        Then PP: set login page email to automation@stamps.com
#        Then PP: set login page password to pass1234
#
#        Then PP: User clicks Log In
#       #Then PP: expect login page error message to be Your account is inactive. Please contact your Partner Manager.



    #@sdc_endicia_pp_login_page_all_status_active
#    Scenario: PP: All Status is Active expect Successful Login
#
#        Then PP: A user navigates to the login page
#
#        Then PP: Partner user's xyz Status is Active
#        Then PP: Partner user's xyz partner account Status is Active
#        Then PP: Partner user's xyz partner contract Status is Active
#
        Then PP: set login page email to automation@stamps.com
        Then PP: set login page password to pass1234
        Then PP: User clicks Log In
        Then PP: expect website redirects user to Dashboard Page
#        Then PP: expect website records login event in Audit Records

#

