Feature: Forgot Password



  Background:
    Given I launched the default browser

  @wp_forgot_password
  Scenario: Forgot Password
    Then I visit postage sign-in page
    Then Mail: Open Forgot Password Modal
    Then Mail: Set forgotten username to Win10gc1000
    Then Mail: Set secret answer 1 to stamps
    Then Mail: Set secret answer 2 to stamps
    Then Mail: Confirm password reset
