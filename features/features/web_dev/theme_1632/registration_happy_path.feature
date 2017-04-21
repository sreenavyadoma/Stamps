Feature: Test Workflow - Theme 1632 Happy Path

  Background:
    Given I loaded SDC Website

  @registration_theme_1632_happy_path
  Scenario: Theme 1632 Happy Path
    Then click on Get Started
    Then set Profile Email to random value
    Then expect Profile Email is correct

    Then set Profile Username to random value
    Then expect Profile Username is correct

    Then set Profile Password to random value
    Then expect Profile Password is correct

    Then set Profile Re-type password to random value
    Then expect Profile Re-Type password is correct

    Then set Profile Survey Question to Mostly mailing
    Then set Profile Survey Question to Mostly shipping
    Then set Profile Survey Question to Both mailing and shipping
    Then set Profile Survey Question to Individual

    Then set Profile Promo Code to PR33-NH77
    Then expect Profile Promo Code is correct

    Then check Profile Money-saving offers and new products
    Then expect Profile Money-saving offers and new products is checked
    Then uncheck Profile Money-saving offers and new products
    Then expect Profile Money-saving offers and new products is unchecked
