Feature: Invalid Credentials

  Background:
    Given I launched default browser

  @mail_invalid_credentials_valid
  Scenario: Valid Username and Password
    Then I am signed in as Mail shipper webpost_0017/pass111
    Then Sign out

  @mail_invalid_credentials
  Scenario: Invalid Password
    Then Expect Invalid Message is "Your username or password is invalid." for webpost_0017/password1
    Then Sign out

  @mail_invalid_credentials
  Scenario: Invalid Username
    Then Expect Invalid Message is "Your username or password is invalid." for webpost/pass111
    Then Sign out

  @mail_invalid_credentials
  Scenario: Missing Password
    Then Expect Invalid Message is "Your username or password is invalid." for webpost_0017/
    Then Sign out

  @mail_invalid_credentials
  Scenario: Missing Username
    Then Expect Invalid Message is "Your username or password is invalid." for  /password1
    Then Sign out

  @mail_invalid_credentials
  Scenario: Missing Username and Password
    Then Expect Invalid Message is "Your username or password is invalid." for  /
    Then Sign out

