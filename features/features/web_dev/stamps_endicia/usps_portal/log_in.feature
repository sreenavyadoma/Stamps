@sdc_endicia_uspsp_log_in
Feature: USPSP: Login Page

    Background:
        Given Start test driver

    @sdc_endicia_USPSP_login_page_ui_validation
    Scenario: USPSP: Login UI Validation
        Then USPSP: A user navigates to the login page

        #verify all content and fields are present
        Then USPSP: expect login page "Welcome to the" content to exist
        Then USPSP: expect login page "stamps.com endicia" logo to exist
        Then USPSP: expect login page "USPS Portal" content to exist
        Then USPSP: expect login page Email field to exist
        Then USPSP: expect login page Email field shows placeholder EMAIL
        Then USPSP: expect login page Password field to exist
        Then USPSP: expect login page Password field shows placeholder PASSWORD
        Then USPSP: expect login page Log In button to exist
        Then USPSP: expect login page Log In button text is Log In
        Then USPSP: expect login page Forgot Password link exist

        # Validate Single Help block tooltips
        Then USPSP: User clicks Log In
        Then USPSP: expect login page email tooltip index 1 to be This field is required.
        Then USPSP: expect login page Password tooltip index 1 to be This field is required.

        #set negative values for tooltip validation
        Then USPSP: set login page email to abc
        Then USPSP: Blur out on Login Page
        Then USPSP: set login page password to a!
        Then USPSP: Blur out on Login Page

     # Validate tooltips for various values
        #Validate Email tooltips
        Then USPSP: expect login page email tooltip count is 1
        Then USPSP: expect login page email tooltip index 0 to be Valid email address required.

        #Validate Password tooltips
#        Then PP: expect login page password tooltip count is 2
#        Then PP: expect login page password tooltip index 1 to be 8 characters minimum.
#        Then PP: expect login page password tooltip index 2 to be At least 1 number required.
#        Then PP: expect login page password tooltip index 3 to be At least 1 letter required.

    #Valiadate email and password can't be the same
        Then USPSP: set login page email to abc@stamps.com
        Then USPSP: set login page password to abc@stamps.com
        Then PP: User clicks Log In
#        Then PP: expect login page password tooltip index 1 to be Cannot match email.

    #validate incorrect email or passowrd message
        Then USPSP: set login page email to abc@stamps.com
        Then USPSP: set login page password to abc123
        Then USPSP: User clicks Log In
        Then USPSP: expect login page error message to be
          """
          Your email / password is incorrect.
          OR
          Logging in for the first time? Click ”Forgot Password“ below.
          """

    #Validate Forgot Password link directs user to Reset Password Page
        #@sdc_endicia_pp_forgot_login_links
#        Scenario: PP: User click Forgot Password links
#          Then PP: A user navigates to the login page
#          Then PP: User clicks Forgot Password link
#          Then PP: expect user is redirected to Reset Password Page

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

#         Then PP: A user navigates to the login page

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
        Then USPSP: set login page email to automation@stamps.com
        Then USPSP: set login page password to pass1234
        Then USPSP: User clicks Log In
        Then USPSP: expect user is redirected to the Dashboard Page
#        Then PP: expect website records login event in Audit Records

#

