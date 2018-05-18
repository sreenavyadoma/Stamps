Feature: PP-MVP: Header and Favicons

  Background:
    Given Start test driver

  @pp_header_favicons_browser
  Scenario: PP: Header and Favicons Validation For Browser
   #Validate header on an unauthenticated page
    #validate header on Reset Password page
    Then PP: a user navigates to Reset Password Page
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

    #validate header on Reset Password Confirmation page
    Then PP: a user navigates to Reset Password Request Confirmation
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

    #validate header on Set Password Page
    Then PP: a user navigates to Set Password Page
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

    #validate header on 404 Page
    Then PP: a user navigates to 404 Page
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

    #validate header on 500 Page
    Then PP: a user navigates to 500 Page
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

   #validate header on login page
    Then PP: A user navigates to the login page
    Then PP: expect global header does not exists

  #Validate header on an authenticated page
    #validate header on Dashboard page
    Then PP: A user navigates to the login page
    Then PP: set login page email to env value
    Then PP: set login page password to env value
    Then PP: User clicks Log In
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists
    Then PP: click on global header
    Then PP: expect dashboard page header exist

  @pp_header_favicons_browser_mobile
  Scenario: PP: Header and Favicons Validation For Mobile

  #Validate header on an unauthenticated page
   #validate header on Reset Password page
    Then PP: a user navigates to Reset Password Page
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists for mobile
    Then PP: expect hamburger button does not exists for mobile
    Then PP: expect X button does not exists
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

    #validate header on Reset Password Confirmation page
    Then PP: a user navigates to Reset Password Request Confirmation
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists for mobile
    Then PP: expect hamburger button does not exists for mobile
    Then PP: expect X button does not exists
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

    #validate header on Set Password Page
    Then PP: a user navigates to Set Password Page
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists for mobile
    Then PP: expect hamburger button does not exists for mobile
    Then PP: expect X button does not exists
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

    #validate footer on 404 Page
    Then PP: a user navigates to 404 Page
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists for mobile
    Then PP: expect hamburger button does not exists for mobile
    Then PP: expect X button does not exists
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

    #validate header on 500 Page
    Then PP: a user navigates to 500 Page
    Then PP: expect global header exists
    Then PP: expect partner portal logo exists
    Then PP: expect Stamps Endicia Partner Portal Logo exists for mobile
    Then PP: expect hamburger button does not exists for mobile
    Then PP: expect X button does not exists
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

    #validate header on login page
    Then PP: A user navigates to the login page
    Then PP: expect global header does not exists

   #Validate header on an authenticated page
    #validate footer on Dashboard page
    Then PP: A user navigates to the login page
    Then PP: set login page email to env value
    Then PP: set login page password to env value
    Then PP: User clicks Log In

    #verify all header content is present
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

    Then PP: click on global header
    Then PP: expect dashboard page header exist
