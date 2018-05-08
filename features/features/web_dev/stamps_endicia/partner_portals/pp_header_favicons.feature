Feature: PP-MVP: Header and Favicons

  Background:
    Given PP: A user navigates to the Reset Password Page

  @pp_header_favicons_browser
  Scenario: PP: Header and Favicons Validation For Browser
    #Validate hamburger button doesn't display on unauthenticated page
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists
    Then PP: expect left panel to expand for browser
    Then PP: expect hamburger button does not exists for browser
    Then PP: expect arrow on left panel does not exists for browser
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
    Then PP: expect user is redirected to the Dashboard page

  @pp_header_favicons_mobile
  Scenario: PP: Header and Favicons Validation For Mobile
    #Then PP: set window to small viewport

    #Validate hamburger button doesn't display on unauthenticated page
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists for mobile
    Then PP: expect hamburger button does not exists for mobile
    Then PP: navigate back to previous page

    #log in
    Then PP: set login page email to env value
    Then PP: set login page password to env value
    Then PP: User clicks Log In

    #verify all content and fields are present
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists for mobile
    #Then PP: click on X button
    Then PP: expect hamburger button exists for mobile

    #validate header for xs
    Then PP: click on hamburger button for mobile
    Then PP: expect left panel to expand for mobile
    Then PP: expect Dashboard on left panel exists
    Then PP: expect X button exists
    Then PP: click on X button
    Then PP: expect left panel to collapse for mobile
    Then PP: expect hamburger button exists for mobile

    #validate header sticks to the top
    Then PP: scroll to middle of the page
    Then PP: click on global header
    Then PP: scroll to buttom of the page
    Then PP: click on global header
    Then PP: scroll to top of the page
    Then PP: click on global header
    Then PP: expect user is redirected to the Dashboard page
