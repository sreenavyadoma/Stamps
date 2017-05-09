Feature: Test Workflow - Theme 1632 Happy Path

  Background:
    Given I loaded SDC Website

  @registration_theme_1632_happy_path
  Scenario: Theme 1632 Happy Path
    Then click on Get Started

    # Profile Page
    Then set Profile page Email to random value
    Then set Profile page Username to random value
    Then set Profile page Password to random value
    Then set Profile page Re-type password to same as previous password
    Then set Profile page Survey Question to Individual
    Then set Profile page Promo Code to PR33-NH77
    Then continue to Membership page

    # Membership Page
    Then set Membership page member address to random address between zone 1 and 4
    Then set Membership page Phone to random value
    Then set Membership page Cardholder's Name to random value
    Then set Membership page Credit Card Number to default value
    Then set Membership page Month to Dec (12)
    Then set Membership page Year to 2026
    Then check Membership page Terms & Conditions

    Then submit Membership Page





