Feature: Forgot Username



  Background:
    Given I launched the default browser

  @wp_forgot_username
  Scenario: Forgot Username
    Then I visit postage sign-in page
    Then Mail: Open Forgot Username Modal
    Then Mail: Set forgotten email to Win10FF1000@mailinator.com



