Feature: WebReg Profile page validation theme_1632
  #  Fix all steps in .feature files that does not have associated step definitions
  #  Remove all step definition duplicates. When you ctrl-click a step in a feature file it should go to exactly one implementation/step defintion.
  #  Run registration_profile_page_ui_validation
  # delete all #logger.something
  # Look at existing page objects for registration and start using it and building on it.

  Background:
    Given I launched default browser

  @registration_profile_page_ui_validation
  Scenario: SDCWR-721 WebReg Profile Page Validation
    Then Load WebReg Profile page
    Then expect WebReg navigation bar Stamps logo exists
    Then expect WebReg navigation bar USPS logo exists
    Then expect WebReg bread crumbs to contain Profile
    Then expect WebReg bread crumbs to contain Membership
    Then expect WebReg bread crumbs to contain Choose Supplies
    Then expect WebReg Profile header contain Sign up for a new account
    Then expect WebReg Profile email exists
    Then expect WebReg Profile username exists
    Then expect WebReg Profile password exists
    Then expect WebReg Profile retype password exists
    Then expect WebReg Profile Usage Type list of values to contain Business Use - Mostly mailing (letters/postcards/flats
    Then expect WebReg Profile Usage Type list of values to contain Business/Ecommerce Use - Mostly shipping packages
    Then expect WebReg Profile Usage Type list of values to contain Business Use - Both mailing and shipping
    Then expect WebReg Profile Usage Type list of values to contain Individual/Home Office
    Then expect WebReg Profile promo code textbox exists
    Then expect WebReg Profile CONTINUE button exists
    Then expect WebReg Profile content under Why do I need to create an account
    """
    The USPS requires you to register your name, telephone number and physical address from which your postage will be printed. This information will be used to create your Stamps.com account.
    """
    Then expect WebReg Profile content under Money-saving offers and new products
    """
    Send me special money-saving offers and information on new products and services from Stamps.com and its partners
    """
    Then expect WebReg Profile Money-saving offers and new products checkbox exist and is checkmarked
    Then expect WebReg Profile Privacy Policy link exists and is clickable
    Then expect WebReg Profile copyright link exists
    Then expect WebReg Profile Norton logo exists
    Then expect WebReg Profile TRUSTe logo exists
    Then expect WebReg Profile LIVE chat button exists

