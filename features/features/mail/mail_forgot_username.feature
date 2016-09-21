Feature: Forgot Username



  Background:
    Given I launched default browser

  @wp_forgot_username
  Scenario: Forgot Username
    Then Visit Mail sign in page
    Then Mail: Open Forgot Username Modal
    Then Mail: Set forgotten email to Win10FF1000@mailinator.com



