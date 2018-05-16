
Feature: PP-MVP: Left Panel

  Background:
    Given Start test driver

  @pp_left_panel_browser
  Scenario: PP: Left Panel Validation

  #Validate left panel on an unauthenticated page
    #validate left panel on login page
    Then PP: A user navigates to the login page
    Then PP: expect left panel does not exist for browser

    #validate left panel on Reset Password page
    Then PP: a user navigates to Reset Password Page
    Then PP: expect left panel does not exist for browser

    #validate left panel on Reset Password Confirmation page
    Then PP: a user navigates to Reset Password Request Confirmation
    Then PP: expect left panel does not exist for browser

    #validate header on Set Password Page
    Then PP: a user navigates to Set Password Page
    Then PP: expect left panel does not exist for browser

    #validate header on 404 Page
    Then PP: a user navigates to 404 Page
    Then PP: expect left panel does not exist for browser

    #validate header on 500 Page
    Then PP: a user navigates to 500 Page
    Then PP: expect left panel does not exist for browser

  #Validate header on an authenticated page
    #validate header on Dashboard page
    Then PP: A user navigates to the login page
    Then PP: set login page email to env value
    Then PP: set login page password to env value
    Then PP: User clicks Log In
    Then PP: expect dashboard page header exist

    #validate content are present on left panel
    Then PP: expect left panel to expand for browser
    Then PP: expect arrow on left panel exists for browser
    Then PP: expect dashboard on left panel exists
    Then PP: expect logout on left panel exists
    Then PP: expect usps logo on left panel exists
    #Then PP: expect partner logo is unique to partner

    #validate functionality
    Then PP: click on arrow on left panel
    Then PP: expect left panel to collapse for browser
    Then PP: expect hamburger button exists for browser
    Then PP: click on hamburger button
    Then PP: expect left panel to expand for browser
    Then PP: expect arrow on left panel exists for browser

    #validate Dashboard link on left panel
    Then PP: click on Dashboard on left panel



