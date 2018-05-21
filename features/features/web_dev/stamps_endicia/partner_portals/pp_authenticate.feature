Feature: PP-MVP: Authenticate

  Background:
    Given PP: A valid user is signed into Partner Portal

  @pp_authenticate
  Scenario: PP: Authenticate Validation

    #validate user is un-authenticated after sessions times out
    Then PP: de-authenticate user
    Then PP: expect user is redirect to the login page

   #validate an un-authenticated user is redirected to login page from an un-authenticated page
    #validate Reset Password page
    Then PP: a user navigates to Reset Password Page
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

    #validate Reset Password Confirmation page
    Then PP: a user navigates to Reset Password Request Confirmation
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

    #validate Set Password Page
    Then PP: a user navigates to Set Password Page
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

    #validate 404 Page
    Then PP: a user navigates to 404 Page
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

    #validate 500 Page
    Then PP: a user navigates to 500 Page
    Then PP: click on global header
    Then PP: expect user is redirect to the login page

  #validate a authenticated user can navigate from un-authenticated page to authenticated page
    #validate Dashboard page
    Then PP: A user navigates to the login page
    Then PP: set login page email to env value
    Then PP: set login page password to env value
    Then PP: User clicks Log In
    Then PP: expect dashboard page header exist

    #validate Reset Password page
    Then PP: a user navigates to Reset Password Page
    Then PP: click on global header
    Then PP: expect dashboard page header exist

    #validate Reset Password Confirmation page
    Then PP: a user navigates to Reset Password Request Confirmation
    Then PP: click on global header
    Then PP: expect dashboard page header exist

    #validate Set Password Page
    Then PP: a user navigates to Set Password Page
    Then PP: click on global header
    Then PP: expect dashboard page header exist

    #validate 404 Page
    Then PP: a user navigates to 404 Page
    Then PP: click on global header
    Then PP: expect dashboard page header exist

    #validate 500 Page
    Then PP: a user navigates to 500 Page
    Then PP: click on global header
    Then PP: expect dashboard page header exist