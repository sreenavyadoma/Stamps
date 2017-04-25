Feature: Profile page validation theme_1632
  #  Fix all steps in .feature files that does not have associated step definitions
  #  Remove all step definition duplicates. When you ctrl-click a step in a feature file it should go to exactly one implementation/step defintion.
  #  Run registration_profile_page_ui_validation
  # delete all #logger.something
  # Look at existing page objects for registration and start using it and building on it.

  Background:
    Given I loaded SDC Website

  @registration_profile_page_ui_validation
  Scenario: SDCWR-721 Profile Page Validation
    Then click on Get Started
    Then expect Registration navigation bar Stamps logo exists
    Then expect Registration navigation bar USPS logo exists
    Then expect Registration bread crumbs to contain Profile
#    Then expect Registration bread crumbs to contain Membership
#    Then expect Registration bread crumbs to contain Choose Supplies
#    Then expect Profile header contain Sign up for a new account
#    Then expect Profile email exists
#    Then expect Profile username exists
#    Then expect Profile password exists
#    Then expect Profile retype password exists
#    Then expect Profile Usage Type list of values to contain Business Use - Mostly mailing (letters/postcards/flats
#    Then expect Profile Usage Type list of values to contain Business/Ecommerce Use - Mostly shipping packages
#    Then expect Profile Usage Type list of values to contain Business Use - Both mailing and shipping
#    Then expect Profile Usage Type list of values to contain Individual/Home Office
#    Then expect Profile promo code textbox exists
#    Then expect Profile CONTINUE button exists
#    Then expect Profile content under Why do I need to create an account
#    """
#    The USPS requires you to register your name, telephone number and physical address from which your postage will be printed. This information will be used to create your Stamps.com account.
#    """
#    Then expect Profile content under Money-saving offers and new products
#    """
#    Send me special money-saving offers and information on new products and services from Stamps.com and its partners
#    """
#    Then expect Profile Money-saving offers and new products checkbox exist and is checkmarked
#    Then expect Profile Privacy Policy link exists and is clickable
#    Then expect Profile copyright link exists
#    Then expect Profile Norton logo exists
#    Then expect Profile TRUSTe logo exists
#    Then expect Profile LIVE chat button exists

