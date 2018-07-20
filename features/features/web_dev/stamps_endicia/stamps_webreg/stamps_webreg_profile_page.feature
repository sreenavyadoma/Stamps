Feature: Stamps WebReg: Profile Page

  Background:
    Given Start test driver

  @sdcwr_profile_page_ui_validation
  Scenario: Profile Page Validation

    Then WL: navigates to default registration page for stamps with the following source id 100-TES-WB001

    #Verifying all content present
    Then pause for 5 seconds
    Then WL: expect Registration navigation bar Stamps logo exists
    Then WL: expect Registration navigation bar USPS logo exists
    Then WL: expect Profile bread crumbs is Profile
    Then WL: expect Profile page header contain Sign up and avoid trips to the Post Office
    Then WL: expect Profile page paragraph contain The USPS requires you to register your name, telephone number and physical address from which your postage will be printed. This information will be used to create your Stamps.com account.
    Then WL: expect Profile page SideContent Side Account header is Why do I need to create an account?
    Then WL: expect Profile page Money-saving offers and new products header is "Money-saving offers and new products"
    Then WL: expect Profile page content under Money-saving offers and new products Send me special money-saving offers and information on new products and services from Stamps.com and its partners.
      ###Then WL: expect Profile page Money-saving offers and new products is checked
      ###Then WL: check Profile page Money-saving offers and new products
      ###Then WL: uncheck Profile page Money-saving offers and new products
      ###Then WL: expect Profile page Money-saving offers and new products is unchecked

    # Validate Single Help block tooltips
    Then WL: click profile page continue button
    Then WL: expect Profile page Email tooltip index 1 to be This field is required
    Then WL: expect Profile page username tooltip index 1 to be This field is required
    Then WL: expect Profile page password tooltip index 1 to be This field is required
    Then WL: expect Profile page Re-Password tooltip index 1 to be This field is required

  #Verifying all fields present and set Negative values for tooltip Validation
    Then WL: expect Profile page email exists
    Then WL: set profile page email to k
    Then WL: expect Profile page username exists
    Then WL: set profile page username to r
    Then WL: expect Profile page password exists
    Then WL: set profile page password to !
    Then WL: expect Profile page retype password exists
    Then WL: set profile page re-type password to k
    Then WL: expect Profile page Survey Question exists
    Then WL: expect Profile page promo code link exists
    Then WL: show profile page promo code
    Then WL: expect Profile page promo code exists
    Then WL: expect profile page promo code to equal source id promo code
    Then WL: set profile page promo code to p
    Then WL: expect Profile page CONTINUE button exists
    Then WL: click profile page continue button

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
    Then WL: expect Profile page Re-Password tooltip index 1 to be Passwords don't match

   #Validate promo code tooltips
    Then WL: expect Profile page promo code tooltip 1 to be Invalid promo code

    # Validating all fields with correct values
    Then WL: set profile page email to random value
    Then expect Profile page Email is correct
    Then WL: set profile page username to random value
    Then expect Profile page Username is correct
    Then WL: set profile page password to random value
    Then expect Profile page Password is correct
    Then WL: set profile page re-type password to same as previous password
    Then expect Profile page Re-Type password is correct







    Then WL: set profile page survey question to Individual/Home Office
    Then WL: set profile page how did you hear about us? to Television Commercial
    Then WL: expect profile page promo code to equal source id promo code

    # Validate Survey Question options
    Then set Profile page Survey Question to Mostly shipping
    Then expect Profile page Survey Question is correct
    Then set Profile page Survey Question to Both mailing and shipping
    Then expect Profile page Survey Question is correct
    Then set Profile page Survey Question to Business Use - Mostly mailing (letters/postcards/flats)
    Then expect Profile page Survey Question is correct
    Then set Profile page Survey Question to Individual
    Then expect Profile page Survey Question is correct

    Then set How did you hear about us? to Web Search
    Then set Profile page promo code to PR33-NH77