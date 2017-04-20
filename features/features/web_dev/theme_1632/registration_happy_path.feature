Feature: Test Workflow - Theme 1632 Happy Path

  Background:
    Given I loaded default registration page

  @registration_theme_1632_happy_path
  Scenario: Theme 1632 Happy Path
    Then set Registration Profile Email to random value
    Then expect Registration Profile Email is correct

    Then set Registration Profile Username to random value
    Then expect Registration Profile Username is correct

    Then set Registration Profile Password to random value
    Then set Registration profile Re-type password to random value

    Then set Registration Profile Survey Question to Mostly mailing
    Then set Registration Profile Survey Question to Mostly shipping
    Then set Registration Profile Survey Question to Both mailing and shipping
    Then set Registration Profile Survey Question to Individual

    Then set Registration Profile Promo Code to PR33-NH77
