Feature: Forgot Password



  Background:
    Given I launched default browser

  @mail_forgot_password
  Scenario: Forgot Password
    Then Visit Mail sign in page
    Then Mail: Open Forgot Password Modal
    Then Mail: Set forgotten username to Win10gc1000
    Then Mail: Set secret answer 1 to stamps
    Then Mail: Set secret answer 2 to stamps
    Then Mail: Confirm password reset
