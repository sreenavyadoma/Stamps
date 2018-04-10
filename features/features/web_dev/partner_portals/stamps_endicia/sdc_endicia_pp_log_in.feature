Feature: PP-MVP: Login Page

    Background:
        Given Start test driver
        Given PP: Partner user's xyz Status is Active
        Given PP: Partner user's xyz partner account Status is Active
        Given PP: Partner user's xyz partner contract Status is Active
        Then  PP: A user navigates to the login page

    @sdc_endicia_pp_log_in
    Scenario: PP: Login UI Validation

        #verify all content and fields are present
        Then PP: expect login page header Welcome to the Stamps.com endicia Partner Portal exist
        Then PP: expect login page Email field to exist
        Then PP: expect login page Email field shows placeholder Email
        Then PP: expect login page Password field to exist
        Then PP: expect login page Password field shows placeholder Password
        Then PP: expect login page Log In button to exist
        Then PP: expect login page Forgot Password link exist

        # Validate Single Help block tooltips
        Then PP: User clicks Log In
        Then PP: expect login page email tooltip index 0 to be This field is required.
        Then PP: expect login page Password tooltip index 0 to be This field is required.

        #set negative values for tooltip validation
        Then PP: set login page email field to abc
        #Then PP: user blur off Email
        Then PP: set login page password to a!
       # Then PP: user blur off Password

     # Validate tooltips for various values
        #Validate Email tooltips
        Then PP: expect login page email tooltip count is 1
        Then PP: expect login page email tooltip index 0 to be  Valid email address required.

        #Validate Password tooltips
        Then PP: expect login page password tooltip count is 2
        Then PP: expect login page password tooltip index 1 to be 8 characters minimum.
        Then PP: expect login page password tooltip index 2 to be At least 1 number required.
        Then PP: expect login page password tooltip index 3 to be At least 1 letter required.

    #Valiadate email and password can't be the same
        Then PP: set login page email field to abc@stamps.com
        Then PP: set login page password to abc@stamps.com
        Then PP: expect login page password tooltip index 0 to be Cannot match email.


        Then PP: set login page email field to abc@stamps.com
        Then PP: set login page password to pass1234
        Then PP: User clicks Log In
        Then PP: website redirects user to Dashboard Page
        Then PP: website records login event in Audit Records



       #Then PP: check Profile page Money-saving offers and new products
       # Then PP: set profile page survey question to Mostly shipping
       # Then PP: set profile page survey question to Both mailing and shipping