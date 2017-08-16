Feature: Profile page validation theme_1632

  Background:
    Given I loaded the default registration page

  @registration_ui_validation_profile_page
  Scenario: Profile Page UI Validation

    # Verifying all contents present
    Then expect Registration navigation bar Stamps logo exists
    Then expect Registration navigation bar USPS logo exists
    Then expect Registration bread crumbs is Profile
    Then expect Profile page header contain Sign up and avoid trips to the Post Office
  #The USPS requires you to register your name, telephone number and physical address from which your postage will be printed. This information will be used to create your Stamps.com account.
    Then expect Profile page SideContent Side Account header is "Why do I need to create an account?"
    Then expect Profile page Money-saving offers and new products header is "Money-saving offers and new products"
    #Send me special money-saving offers and information on new products and services from Stamps.com and its partners.
    Then check Profile page Money-saving offers and new products
    Then expect Profile page Money-saving offers and new products is checked
    Then uncheck Profile page Money-saving offers and new products
    Then expect Profile page Money-saving offers and new products is unchecked

    # Verifying all fields present
    Then expect Profile page email exists
    Then expect Profile page username exists
    Then expect Profile page password exists
    Then expect Profile page retype password exists
    Then expect Profile page Survey Question exists
    Then expect Profile page promo code link exists
    Then show profile page promo code textbox
    Then expect Profile page promo code textbox exists
    Then expect Profile page CONTINUE button exists
    Then expect Profile page Privacy Policy link exists
    Then expect Profile page copyright link exists

    # Validate Password tooltips for various values
    #Then expect Profile page email tooltip count is 3
    Then expect Profile page email tooltip 1 to be 6 character minimum
    #Then expect Profile page email tooltip 2 to be At least 1 number required
    #Then expect Profile page email tooltip 3 to be Cannot match username

    #1. This field is required
    #2.  6 character minimum
    #    At least 1 number required
    #    Cannot match username


    # Validating all fields
    Then set Profile page Email to random value
    Then expect Profile page Email is correct
    Then set Profile page Username to random value
    Then expect Profile page Username is correct
    Then set Profile page Password to random value
    Then expect Profile page Password is correct
    Then set Profile page Re-type password to same as previous password
    Then expect Profile page Re-Type password is correct

    # Validate Survey Question options
    Then set Profile page Survey Question to Mostly shipping
    Then expect Profile page Survey Question is correct
    Then set Profile page Survey Question to Both mailing and shipping
    Then expect Profile page Survey Question is correct
    Then set Profile page Survey Question to Business Use - Mostly mailing (letters/postcards/flats)
    Then expect Profile page Survey Question is correct
    Then set Profile page Survey Question to Individual
    Then expect Profile page Survey Question is correct

    Then set Profile page promo code to PR33-NH77

