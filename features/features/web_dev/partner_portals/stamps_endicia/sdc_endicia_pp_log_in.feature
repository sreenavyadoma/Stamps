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
        Then PP: expect login page email field shows error message This field is required.
        Then PP: expect login page Password shows error message This field is required.

        #set negative values for tooltip validation
        Then PP: set login page email field to abc
        #Then PP: user blur off Email
        Then PP: set login page password to a!
       # Then PP: user blur off Password

     # Validate tooltips for various values
        #Validate Email tooltips
        Then PP: expect login page email field shows error message Valid email requested
        #Validate Password tooltips
        Then PP: expect login page password shows error message Field value should have at least 8 characters
        Then PP: expect login page password shows error message "Field value should include at least 1 number"
        Then PP: expect login page password shows error message "Field value should include at least 1 letter"


#        Then PP: user enters same valid value into Email and Password
#        Then PP: user blurs off Password
#        Then PP: password shows error message "Field value should not be the same as EMAIL"
#        Then PP: user enters valid Email/Password combination
#        Then PP: user clicks Log In
#        Then PP: website redirects user to Dashboard Page
#        Then PP: website records login event in Audit Records



       #Then PP: check Profile page Money-saving offers and new products
       # Then PP: set profile page survey question to Mostly shipping
       # Then PP: set profile page survey question to Both mailing and shipping