@mail_credentials
Feature: Forgot Password, Forgot Username, Invalid Credentials, Remember Username

  Background:
    Given I launched the browser

  @mail_forgot_password
  Scenario: Forgot Password
    Then load Web Apps Sign-in page
    Then Mail: Open Forgot Password Modal
    Then on Print form, set forgotten username to Win10gc1000
    Then on Print form, set secret answer 1 to stamps
    Then on Print form, set secret answer 2 to stamps
    Then Mail: Confirm password reset

  @mail_forgot_username
  Scenario: Forgot Username
    Then load Web Apps Sign-in page
    Then Mail: Open Forgot Username Modal
    Then on Print form, set forgotten email to Win10FF1000@mailinator.com

  @mail_invalid_credentials_valid
  Scenario: Valid Username and Password
    Then a valid user is signed in to Web Apps webpost_0017/pass111
    Then sign out

  #@mail_invalid_credentials
  Scenario: Invalid Password
    Then Expect Invalid Message is "Your username or password is invalid." for webpost_0017/password1
    Then sign out

  #@mail_invalid_credentials
  Scenario: Invalid Username
    Then Expect Invalid Message is "Your username or password is invalid." for webpost/pass111
    Then sign out

  #@mail_invalid_credentials
  Scenario: Missing Password
    Then Expect Invalid Message is "Your username or password is invalid." for webpost_0017/
    Then sign out

  #@mail_invalid_credentials
  Scenario: Missing Username
    Then Expect Invalid Message is "Your username or password is invalid." for  /password1
    Then sign out

  #@mail_invalid_credentials
  Scenario: Missing Username and Password
    Then Expect Invalid Message is "Your username or password is invalid." for  /
    Then sign out

  #@mail_remember_username
  Scenario: Remember Username
    Then load Web Apps Sign-in page
    Then Mail Sign In: Set Username to
    Then Mail Sign In: Set Remember Username to Checked
    Then sign out
    Then Mail Sign In: Check Remember Username
    Then Mail Sign In: Expect Remember Username is checked

  #@mail_remember_username
  Scenario: Forget Username
    Then load Web Apps Sign-in page
    Then Mail Sign In: Set Remember Username to Unchecked
    Then sign out
    Then Mail Sign In: Check Remember Username
    Then Mail Sign In: Expect Remember Username is unchecked