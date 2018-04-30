Feature:  Mail Credentials Tests

 Background:
    Given Start test driver

  @mail_remember_username
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

  @mail_invalid_credentials
  Scenario: Mail - Invalid Credentials
    Then visit Mail
    Then set username in Mail
    Then click the Sign In button in Mail expecting error message "Your username or password is invalid"
