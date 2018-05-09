Feature:  Mail BVT - Authentication

  Background:
    Given Start test driver

  @mail_authentication
  Scenario: Mail - Authentication
    Then visit Mail
    Then sign-in to Mail using credentials from MySql
    Then sign-out of SDC Website

  @mail_authentication
  Scenario: Mail - Remember Username
    Then fetch user credentials from MySQL
    Then visit Mail
    Then set Mail username
    Then set Mail password
    Then set Remember Username to Checked
    Then click the Sign In button in Mail
    Then expect user is signed in
    Then sign-out of SDC Website
    Then visit Mail
    Then open sign in modal in Mail
    Then expect username is present in Mail username field
    Then expect Remember Username is checked

  @mail_authentication
  Scenario: Mail - Invalid Credentials
    Then fetch user credentials from MySQL
    Then visit Mail
    Then set Mail username
    Then click the Sign In button in Mail
    Then expect Mail Sign In Modal error Your username or password is invalid.