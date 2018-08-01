Feature: Stamps WebReg: Profile Page

  Background:
    Given Start test driver

  @sdcwr_profile_page_ui_validation
  Scenario: Profile Page Validation

    Then WL: navigates to default registration page for stamps with the following offer id 391

    #Verifying all content present
    Then pause for 5 seconds
    Then WL: expect Registration navigation bar Stamps logo exists
    Then WL: expect Registration navigation bar USPS logo exists
    Then WL: expect Profile bread crumbs is Profile
    Then WL: expect Profile page header contain Sign up and avoid trips to the Post Office
    Then WL: expect Profile page paragraph contain
    """
    The USPS requires you to register your name, telephone number and physical address from which your postage will be printed. This information will be used to create your Stamps.com account.
    """
    Then WL: expect Profile page SideContent Side Account header is Why do I need to create an account?
    Then WL: expect Profile page Money-saving offers and new products header is "Money-saving offers and new products"
    Then WL: expect Profile page content under Money-saving offers and new products
    """
    Send me special money-saving offers and information on new products and services from Stamps.com and its partners.
    """
    Then WL: expect Profile page Money-saving offers and new products is checked
    Then WL: uncheck Profile page Money-saving offers and new products
    Then WL: check Profile page Money-saving offers and new products
    Then WL: expect Profile page Money-saving offers and new products is unchecked

    # Validate Single Help block tooltips
    Then WL: click profile page CONTINUE button
    Then WL: expect Profile page Email tooltip index 1 to be This field is required
    Then WL: expect Profile page username tooltip index 1 to be This field is required
    Then WL: expect Profile page password tooltip index 1 to be This field is required
    Then WL: expect Profile page re-type Password tooltip index 1 to be This field is required
    Then WL: expect first security question tooltip index 1 to be This field is required
    Then WL: expect first security answer tooltip index 1 to be This field is required
    Then WL: expect second security question tooltip index 1 to be This field is required
    Then WL: expect second security answer tooltip index 1 to be This field is required

  #Verifying all fields present and set Negative values for tooltip Validation
    Then WL: expect Profile page email exists
    Then WL: set profile page email to k
    Then WL: expect Profile page username exists
    Then WL: set profile page username to r
    Then WL: expect Profile page password exists
    Then WL: set profile page password to !
    Then WL: expect Profile page re-type password exists
    Then WL: set profile page re-type password to k
    Then WL: expect Profile page Survey Question exists
    Then WL: expect Profile page promo code link exists
    Then WL: show profile page promo code
    Then WL: expect Profile page promo code exists
    Then WL: expect profile page promo code to equal source id promo code
    Then WL: set profile page promo code to test1234567
    Then WL: expect Profile page CONTINUE button exists
    Then WL: click profile page CONTINUE button

   # Validate tooltips for various values
   #Validate Email tooltips
    Then WL: expect Profile page Email tooltip count is 2
    Then WL: expect Profile page Email tooltip index 1 to be 5 character minimum
    Then WL: expect Profile page Email tooltip index 2 to be Valid email address required

    #Validate Username tooltips
    Then WL: expect Profile page Username tooltip count is 1
    Then WL: expect Profile page username tooltip index 1 to be 2 character minimum
    # Validate Password tooltips
    Then WL: expect Profile page Password tooltip count is 3
    Then WL: expect Profile page Password tooltip index 1 to be 6 character minimum
    Then WL: expect Profile page Password tooltip index 2 to be At least 1 number required
    Then WL: expect Profile page Password tooltip index 3 to be At least 1 letter required

    # Validate Re-type password tooltips
    Then WL: expect Profile page re-type Password tooltip index 1 to be Passwords don't match

   #Validate promo code tooltips
    Then WL: expect Profile page promo code tooltip 1 to be Invalid promo code

    # Validating all fields with correct values
    Then WL: set profile page email to random value
    Then WL: expect profile page email is correct

    Then WL: set profile page username to random value
    Then WL: expect profile page username is correct

    Then WL: set profile page password to random value
    Then WL: expect profile page password is correct

    Then WL: set profile page re-type password to same as previous password

    # Validate Survey Question options
    Then WL: set profile page survey question to Individual/Home Office
    Then WL: expect profile page survey question is correct
    Then WL: set profile page survey question to Business Use - Both mailing and shipping
    Then WL: expect profile page survey question is correct
    Then WL: set profile page survey question to Business Use - Mostly mailing (letters/postcards/flats)
    Then WL: expect profile page survey question is correct
    Then WL: set profile page survey question to Business/Ecommerce Use - Mostly shipping packages
    Then WL: expect profile page survey question is correct

    Then WL: set profile page how did you hear about us? to Television Commercial
    Then WL: expect profile page how did you hear about us option is correct
    Then WL: set profile page how did you hear about us? to Web Search
    Then WL: expect profile page how did you hear about us option is correct
    Then WL: set profile page how did you hear about us? to Received Mailer
    Then WL: expect profile page how did you hear about us option is correct
    Then WL: set profile page how did you hear about us? to Recommended by Friend
    Then WL: expect profile page how did you hear about us option is correct
    Then WL: set profile page how did you hear about us? to Radio/Podcast/Streaming Audio
    Then WL: expect profile page how did you hear about us option is correct
    Then WL: set profile page how did you hear about us? to Other
    Then WL: expect profile page how did you hear about us option is correct

    # Validate Promo code
    Then WL: set profile page promo code to 522MB

    # Validate Security Quetion Modal
    # Validate first Security Quetion list
    Then WL: select security questions first security question What is your mother's maiden name?
    Then WL: expect security questions first security question is correct
    Then WL: select security questions first security question What is your pet's name?
    Then WL: expect security questions first security question is correct
    Then WL: select security questions first security question What is your city of birth?
    Then WL: expect security questions first security question is correct
    Then WL: select security questions first security question What was your high school mascot?
    Then WL: expect security questions first security question is correct
    Then WL: select security questions first security question What is your father's birthplace?
    Then WL: expect security questions first security question is correct
    Then WL: select security questions first security question What street did you grow up on?
    Then WL: expect security questions first security question is correct
    Then WL: select security questions first security question What is the name of your first school?
    Then WL: expect security questions first security question is correct
    Then WL: select security questions first security question What is the make and model of your first car?
    Then WL: expect security questions first security question is correct

    # Validate second Security Quetion list
    Then WL: select security questions second security question What is your mother's maiden name?
    Then WL: expect security questions second security question is correct
    Then WL: select security questions second security question What is your pet's name?
    Then WL: expect security questions second security question is correct
    Then WL: select security questions second security question What is your city of birth?
    Then WL: expect security questions second security question is correct
    Then WL: select security questions second security question What was your high school mascot?
    Then WL: expect security questions second security question is correct
    Then WL: select security questions second security question What is your father's birthplace?
    Then WL: expect security questions second security question is correct
    Then WL: select security questions second security question What street did you grow up on?
    Then WL: expect security questions second security question is correct
    Then WL: select security questions second security question What is the name of your first school?
    Then WL: expect security questions second security question is correct

    Then WL: if security question is present before registration then set the values
    Then WL: click profile page CONTINUE button

    # Validate navigate to Membership page
    Then WL: expect membership page bread crumbs is Membership

    # Validate Security Quetions Modal does not present
    Then WL: navigates to default registration page for stamps with the following offer id 399
    Then pause for 5 seconds
    Then WL: expect security question modal does not exists
