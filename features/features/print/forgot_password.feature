Feature: Forgot Password



  Background:
    Given I visit postage sign-in page qacc

  @wp_forgot_password
  Scenario: Forgot Password

    Then Postage: Open Forgot Password Modal
    Then Postage: Set forgotten username to WinXPie1000
    Then Postage: Set secret answer 1 to stamps
    Then Postage: Set secret answer 2 to stamps
    Then Postage: Confirm password reset
