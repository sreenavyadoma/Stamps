Feature: Test Workflow - Theme 1632 Happy Path

  Background:
    Given I loaded SDC Website

  @registration_theme_1632_happy_path
  Scenario: Theme 1632 Happy Path
    Then click on Get Started
    Then set Profile page Email to random value
    Then expect Profile page Email is correct

    Then set Profile page Username to random value
    Then expect Profile page Username is correct

    Then set Profile page Password to random value
    Then expect Profile page Password is correct

    Then set Profile page Re-type password to random value
    Then expect Profile page Re-Type password is correct

    Then set Profile page Survey Question to Mostly mailing
    Then set Profile page Survey Question to Mostly shipping
    Then set Profile page Survey Question to Both mailing and shipping
    Then set Profile page Survey Question to Individual

    Then set Profile page Referer Name to Magazine Ad
    Then set Profile page Referer Name to Streaming Audio
    Then set Profile page Referer Name to Television Commercial
    Then set Profile page Referer Name to Telephone Call
    Then set Profile page Referer Name to Web Search
    Then set Profile page Referer Name to Web Banner
    Then set Profile page Referer Name to Trade show
    Then set Profile page Referer Name to Recommended by USPS
    Then set Profile page Referer Name to Recommended by Friend
    Then set Profile page Referer Name to Other
    Then set Profile page Referer Name to Newspaper Ad
    Then set Profile page Referer Name to Received Mailer
    Then set Profile page Referer Name to Received Mailer
    Then set Profile page Referer Name to Email from Stamps.com
    Then set Profile page Referer Name to Already used in office

    Then set Profile page Promo Code to PR33-NH77
    Then expect Profile page Promo Code is correct

    Then check Profile page Money-saving offers and new products
    Then expect Profile page Money-saving offers and new products is checked
    Then uncheck Profile page Money-saving offers and new products
    Then expect Profile page Money-saving offers and new products is unchecked

    Then continue to Membership page
    
    Then set Membership First Name


