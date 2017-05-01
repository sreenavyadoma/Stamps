Feature: Profile page page validation theme_1632
  #  Fix all steps in .feature files that does not have associated step definitions
  #  Remove all step definition duplicates. When you ctrl-click a step in a feature file it should go to exactly one implementation/step defintion.
  #  Run registration_profile_page_ui_validation
  # delete all #logger.something
  # Look at existing page objects for registration and start using it and building on it.

  Background:
    Given I loaded SDC Website

  @registration_profile_page_ui_validation
  Scenario: SDCWR-721 Profile page Page Validation
    Then click on Get Started
    Then expect Registration navigation bar Stamps logo exists
    Then expect Registration navigation bar USPS logo exists

    Then expect Registration bread crumbs is Profile
    Then expect Registration bread crumbs is Membership
    #Then expect Registration bread crumbs is Special Offer
    Then expect Profile page header contain Sign up for a new account
    Then expect Profile page email exists
    Then expect Profile page username exists
    Then expect Profile page password exists
    Then expect Profile page retype password exists

    Then set Profile page Survey Question to Mostly mailing
    Then set Profile page Survey Question to Mostly shipping
    Then set Profile page Survey Question to Both mailing and shipping
    Then set Profile page Survey Question to Individual

#    Then expect Profile page promo code textbox exists
#    Then expect Profile page CONTINUE button exists
#    Then expect Profile page content under Why do I need to create an account
#    """
#    The USPS requires you to register your name, telephone number and physical address from which your postage will be printed. This information will be used to create your Stamps.com account.
#    """
#    Then expect Profile page content under Money-saving offers and new products
#    """
#    Send me special money-saving offers and information on new products and services from Stamps.com and its partners
#    """
#    Then expect Profile page Money-saving offers and new products checkbox exist and is checkmarked
#    Then expect Profile page Privacy Policy link exists and is clickable
#    Then expect Profile page copyright link exists
#    Then expect Profile page Norton logo exists
#    Then expect Profile page TRUSTe logo exists
#    Then expect Profile page LIVE chat button exists

