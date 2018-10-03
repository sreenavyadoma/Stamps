Feature:  Landing Page

  Background:
    Given Start test driver

  @changes_to_landing_page
  Scenario: WEBAPPS-11290 Changes to Sign In Page
    Then visit Orders landing page
    Then expect landing page help link is Visit our Learning Center
    Then expect landing page sign up link is New to Stamps.com? Sign Up
    Then click sign up link on landing page
    Then expect resulting web reg url is correct
    Then visit Orders landing page
    Then click on visit our learning center link on landing page
    Then expect resulting help page url is correct
