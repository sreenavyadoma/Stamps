Feature: PP-MVP: Header and Favicons

  Background:
    Given PP: A user navigates to the Reset Password Page

  @pp_header_favicons_browser
  Scenario: PP: Header and Favicons Validation For Browser
    #Validate hamburger button doesn't display on unauthenticated page
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists
    Then PP: expect hamburger button does not exists for browser
    Then PP: navigate back to previous page

    #log in
    Then PP: set login page email to env value
    Then PP: set login page password to env value
    Then PP: User clicks Log In

    #verify all content and fields are present
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists
    Then PP: expect arrow on left panel exists for browser
    Then PP: click on arrow on left panel
    Then PP: expect hamburger button exists for browser

    Then PP: click on global header
    Then PP: expect dashboard page header exist

  @pp_header_favicons_browser_mobile
  Scenario: PP: Header and Favicons Validation For Mobile
    #Validate hamburger button doesn't display on unauthenticated page
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists for mobile
    Then PP: expect hamburger button does not exists for mobile
    Then PP: expect X button does not exists
    Then PP: navigate back to previous page

    #log in
    Then PP: set login page email to env value
    Then PP: set login page password to env value
    Then PP: User clicks Log In

    #verify all content and fields are present
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists for mobile
    Then PP: expect hamburger button exists for mobile

    #validate header for xs
    Then PP: click on hamburger button for mobile
    Then PP: expect left panel to expand for mobile
    Then PP: expect Dashboard on left panel exists
    Then PP: expect X button exists
    Then PP: click on X button
    Then PP: expect left panel to collapse for mobile
    Then PP: expect hamburger button exists for mobile


