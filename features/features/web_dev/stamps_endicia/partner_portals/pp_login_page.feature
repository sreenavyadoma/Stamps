@pp_login_page
Feature: PP-MVP: Login Page

    Background:
        Given Start test driver

    Scenario: PP: Login Page Validation

        Then PP: A user navigates to the login page

        #verify all content and fields are present
        Then PP: expect login page "Welcome to the" content to exist
        Then PP: expect login page "stamps.com endicia" logo to exist
        Then PP: expect login page "Partner Portal" content to exist
        Then PP: expect login page Email field to exist
        Then PP: expect login page Email field shows placeholder Email
        Then PP: expect login page Password field to exist
        Then PP: expect login page Password field shows placeholder Password
        Then PP: expect login page Log In button to exist
        Then PP: expect login page Log In button text is Log In
        Then PP: expect login page Forgot Password link exist

        # Validate Single Help block tooltips
        Then PP: User clicks Log In
        Then PP: expect login page email tooltip index 1 to be This field is required.
        Then PP: expect login page password tooltip index 1 to be This field is required.

        #set negative values for tooltip validation
        Then PP: set login page email to abc
        Then PP: Blur out on Login Page
        Then PP: set login page password to !
        Then PP: Blur out on Login Page

       # Validate tooltips for various values
        #Validate Email tooltips
        Then PP: expect login page email tooltip count is 1
        Then PP: expect login page email tooltip index 0 to be Valid email address required.

        # Validate Password tooltips
        Then PP: expect login page password tooltip count is 3
        Then PP: expect login page password tooltip index 1 to be At least 1 letter required.
        Then PP: expect login page password tooltip index 2 to be At least 1 number required.
        Then PP: expect login page password tooltip index 3 to be 8 character minimum.

        #Validate Password tooltips for  At least 1 letter required.
        Then PP: set login page password to 1234151523
        Then PP: Blur out on Login Page
        Then PP: expect login page password tooltip count is 1
        Then PP: expect login page password tooltip index 1 to be At least 1 letter required.

        #Validate Password tooltips for At least 1 number required.
        Then PP: set login page password to abcdefghigh
        Then PP: Blur out on Login Page
        Then PP: expect login page password tooltip count is 1
        Then PP: expect login page password tooltip index 1 to be At least 1 number required.

        #Validate Password tooltips for 8 character minimum.
        Then PP: set login page password to abc1
        Then PP: Blur out on Login Page
        Then PP: expect login page password tooltip count is 1
        Then PP: expect login page password tooltip index 1 to be 8 character minimum.

      #Valiadate email and password can't be the same
        Then PP: set login page email to abc1@stamps.com
        Then PP: set login page password to abc1@stamps.com
        Then PP: User clicks Log In
        Then PP: expect login page password tooltip index 1 to be Cannot match email.


      #validate incorrect email or password message
        Then PP: set login page email to abc@stamps.com
        Then PP: set login page password to abcdefg123
        Then PP: User clicks Log In
        Then PP: expect login page error message to be
          """
          Your email or password is incorrect, please try again.
          For assistance, please contact your Partner Manager.
          """


    #Validate User Status is inactive expect unsuccessful login
        Then PP: set login page email to webdevauto@stamps.com
        Then PP: set login page password to password1
        Then PP: User clicks Log In
        Then PP: expect login page error message to be
        """
        Your account is inactive. Please contact your Partner Manager.
        """


    #Partner Account Status is inactive expect unsuccessful login
        Then PP: set login page email to webdevauto1@stamps.com
        Then PP: set login page password to password1
        Then PP: User clicks Log In
        Then PP: expect login page error message to be
        """
        Your account is inactive. Please contact your Partner Manager.
        """

    #Partner Contract Status is inactive expect unsuccessful login
        Then PP: set login page email to webdevauto2@stamps.com
        Then PP: set login page password to password1
        Then PP: User clicks Log In
        Then PP: expect login page error message to be
        """
        Your account is inactive. Please contact your Partner Manager.
        """

    #Validate Forgot Password link directs user to Reset Password Page
        Then PP: User clicks Forgot Password link
        Then PP: expect user is redirected to Reset Password Page
        Then PP: navigate back to previous page



    #Validate successful log in
        Then PP: set login page email to wteam@stamps.com
        Then PP: set login page password to password1
        Then PP: User clicks Log In
        Then PP: expect user is redirected to the Dashboard Page
        Then PP: expect website records login event in Audit Records to be Login success





