Feature:  Mail BVT - Authentication

  Background:
    Given Start test driver

  @mail_authentication
  Scenario: Mail - Authentication
    Then visit Mail
    Then sign-in to Mail
    Then sign-out of SDC Website

  @mail_authentication
  Scenario: Mail - Remember Username
    Then visit Mail
    Then set username in Mail
    Then set password in Mail
    Then set Remember Username to Checked
    Then click the Sign In button in Mail
    Then sign-out of SDC Website
    Then visit Mail
    Then open sign in modal in Mail
    Then expect username is present in Mail username field
    Then expect Remember Username to be checked

  @mail_authentication
  Scenario: Mail - Invalid Credentials
    Then visit Mail
    Then set username in Mail
    Then click the Sign In button in Mail
    Then expect Mail Sign In Modal error Your username or password is invalid.




