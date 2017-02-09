Feature: Forgot Password

  Background:
    Given I launched default browser

  @mail_forgot_password
  Scenario: Forgot Password
    Then load Sign-in page
    Then Mail: Open Forgot Password Modal
    Then on Print form, set forgotten username to Win10gc1000
    Then on Print form, set secret answer 1 to stamps
    Then on Print form, set secret answer 2 to stamps
    Then Mail: Confirm password reset
